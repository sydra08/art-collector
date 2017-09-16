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
      # add flash message here about invalid registration
      redirect to '/signup'
    end
  end

  get '/login' do
    erb :'/users/login'
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show_user'
  end

  get '/logout' do
    redirect to '/login'
  end

end
