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
      # should this be changed to Collection.find(session[:collection]) || Collection.find(params[:id])
    end

    def user_collection_valid?
      # checks if the collection belongs to the current user
      # mostly used when trying to add a new artwork to a collection
      current_user.collection_ids.include?(current_collection.id)
    end
  end

end
