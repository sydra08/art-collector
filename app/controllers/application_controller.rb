require './config/environment'

class ApplicationController < Sinatra::Base
  use Rack::Flash
  configure do
    enable :sessions
    set :session_secret, "artisthebest"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :index
  end

  helpers do
    def current_user
      @current_user ||= User.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_collection
      @current_collection ||= Collection.find(session[:collection])
    end

    def user_collection_valid?
      # checks if the collection belongs to the current user
      current_user.collection_ids.include?(current_collection.id)
    end
  end

end
