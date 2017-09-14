class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/create_user'
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
