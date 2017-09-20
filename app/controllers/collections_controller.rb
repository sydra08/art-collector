class CollectionsController < ApplicationController

  get '/collections/new' do
    if logged_in?
      erb :'/collections/create_collection'
    else
      flash[:message] = "You must be logged in to do that"
      redirect '/login'
    end
  end

  post '/collections' do
    @collection = Collection.new(name: params[:collection][:name], artwork_ids: params[:collection][:artwork_ids])
    if @collection.save
      current_user.collections << @collection
      flash[:message] = "Successfully created collection"
      redirect to "/collections/#{@collection.id}"
    else
      flash[:message] = "Unable to create collection"
      redirect to "/collections/#{@collection.id}"
    end
  end

  get '/collections/:id' do
    @collection = Collection.find(params[:id])
    session[:collection] = @collection.id
    # anytime a user visits one of their collections, the session[:collection] value is reset
    # need to add more validations around the collection belonging to the user since the info is in the session?
    erb :'/collections/show_collection'
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
    @collection = Collection.find(params[:id])
    erb :'/collections/edit_collection'
  end

  delete '/collections/:id/delete' do
    @collection = Collection.find(params[:id])
    # add a pop up confirmation box before deleting
    if logged_in? && current_user.collection_ids.include?(@collection.id)
      @collection.destroy
      flash[:message] = "Collection deleted"
      redirect to "/users/#{current_user.slug}"
    else
      flash[:message] = "You cannot edit another user's collection"
      redirect to "/users/#{current_user.slug}"
    end
  end

end
