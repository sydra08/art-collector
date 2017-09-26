class UsersController < ApplicationController

  get '/signup' do
    # raise session.inspect
    if logged_in?
      redirect to '/login'
    else
      erb :'/users/create_user'
    end
  end

  post '/users' do
    @user = User.new(params)
    if @user.invalid?
      flash[:message] = "#{@user.errors[:username][0]}"
      redirect to '/signup'
    else
      @user.save
      session[:user_id] = @user.id
      redirect to "/users/#{@user.slug}"
    end
  end

  get '/login' do
    if logged_in?
      redirect to "/users/#{current_user.slug}"
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/users/#{@user.slug}"
    else
      flash[:message] = "Error: Incorrect username or password"
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      flash[:message] = "Successfully logged out"
      redirect to '/login'
    else
      flash[:message] = "Error: You must be logged in to do that"
      redirect to '/'
    end
  end

  get '/users/:slug' do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      if current_user == @user
        erb :'/users/show_user'
      else
        flash[:message] = "Error: You cannot view another user's homepage"
        redirect to "/users/#{current_user.slug}"
      end
    else
      flash[:message] = "Error: You must be logged in to do that"
      redirect to '/'
    end
  end

end
