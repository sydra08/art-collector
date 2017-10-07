class CollectionsController < ApplicationController

  get '/collections/new' do
    authenticate_user
    erb :'/collections/create_collection'
  end

  post '/collections' do
    authenticate_user
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
    authenticate_user
    if @collection = current_user.collections.find_by(id: params[:id])
      session[:collection] = @collection.id
      erb :'/collections/show_collection'
    else
      flash[:message] = "Error: You cannot view another user's collection"
      redirect to "/users/#{current_user.slug}"
    end
  end

  patch '/collections/:id' do
    authenticate_user
    @collection = Collection.find(params[:id])
    if !params[:collection][:name].empty?
      # only update the name if the field isn't empty
      @collection.name = params[:collection][:name]
      @collection.save
    end

    redirect to "/collections/#{@collection.id}"
  end

  get '/collections/:id/edit' do
    authenticate_user
    @collection = Collection.find(params[:id])
    if current_user.collection_ids.include?(@collection.id)
      session[:collection] = @collection.id
      erb :'/collections/edit_collection'
    else
      flash[:message] = "Error: You cannot edit another user's collection"
      redirect to "/users/#{current_user.slug}"
    end
  end

  delete '/collections/:id/delete' do
    authenticate_user
    @collection = Collection.find(params[:id])
    if user_collection_valid?
      @collection.destroy
      flash[:message] = "Collection deleted"
      redirect to "/users/#{current_user.slug}"
    else
      flash[:message] = "Error: You cannot edit another user's collection"
      redirect to "/users/#{current_user.slug}"
    end
  end

end
