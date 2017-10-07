class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/login'
    else
      erb :'/users/create_user'
    end
  end

  post '/users' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect to "/users/#{@user.slug}"
    else
      flash[:message] = "Error: #{@user.errors.messages.values[0][0]}"
      redirect to '/signup'
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
      # make sure the password is valid
      session[:user_id] = @user.id
      redirect to "/users/#{@user.slug}"
    else
      flash[:message] = "Error: Incorrect username or password"
      redirect to '/login'
    end
  end

  get '/logout' do
    authenticate_user
    session.destroy
    flash[:message] = "Successfully logged out"
    redirect to '/login'
  end

  get '/users/:slug' do
    authenticate_user
    @user = User.find_by_slug(params[:slug])
    if current_user == @user
      erb :'/users/show_user'
    else
      flash[:message] = "Error: You cannot view another user's homepage"
      redirect to "/users/#{current_user.slug}"
    end
  end

end
