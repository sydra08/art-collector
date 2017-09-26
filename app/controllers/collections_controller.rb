class CollectionsController < ApplicationController

  get '/collections/new' do
    if logged_in?
      erb :'/collections/create_collection'
    else
      flash[:message] = "Error: You must be logged in to do that"
      redirect '/login'
    end
  end

  post '/collections' do
    @collection = Collection.new(name: params[:collection][:name], artwork_ids: params[:collection][:artwork_ids])
    if @collection.valid? && !user_collection_names.include?(@collection.name)
      current_user.collections << @collection
      flash[:message] = "Successfully created collection"
      redirect to "/collections/#{@collection.id}"
    else
      flash[:message] = "Error: You already have a collection with that name"
      redirect to '/collections/new'
    end
  end

  get '/collections/:id' do
    if logged_in?
      @collection = Collection.find(params[:id])
      if current_user.collections.include?(@collection)
        session[:collection] = @collection.id
        erb :'/collections/show_collection'
      else
        flash[:message] = "Error: You cannot view another user's collection"
        redirect to "/users/#{current_user.slug}"
      end
    else
      flash[:message] = "Error: You must be logged in to do that"
      redirect to "/login"
    end
  end

  patch '/collections/:id' do
    @collection = Collection.find(params[:id])
    if !params[:collection][:name].empty?
      @collection.name = params[:collection][:name]
    end
    @collection.save

    redirect to "/collections/#{@collection.id}"
  end

  get '/collections/:id/edit' do
    if logged_in?
      @collection = Collection.find(params[:id])
      if current_user.collections.include?(@collection)
        erb :'/collections/edit_collection'
      else
        flash[:message] = "Error: You cannot edit another user's collection"
        redirect to "/users/#{current_user.slug}"
      end
    else
      flash[:message] = "Error: You must be logged in to do that"
      redirect to "/login"
    end
  end

  delete '/collections/:id/delete' do
    @collection = Collection.find(params[:id])
    # can use user_collection_valid? here because a user cannot access the show collection view
    if logged_in? && user_collection_valid?
      @collection.destroy
      flash[:message] = "Collection deleted"
      redirect to "/users/#{current_user.slug}"
    else
      flash[:message] = "Error: You cannot edit another user's collection"
      redirect to "/users/#{current_user.slug}"
    end
  end

end
