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
    if @collection.valid?
      current_user.collections << @collection
      current_user.save
      flash[:message] = "Successfully created collection"
      redirect to "/collections/#{@collection.id}"
    else
      binding.pry
      flash[:message] = "Unable to create collection"
      redirect to "/collections/#{@collection.id}"
    end
  end

  get '/collections/:id' do
    if logged_in?
      @collection = Collection.find(params[:id])
      if user_collection_valid?
        session[:collection] = @collection.id
        erb :'/collections/show_collection'
      else
        flash[:message] = "You cannot view another user's collection"
        redirect to "/users/#{current_user.slug}"
      end
    else
      flash[:message] = "You must be logged in to do that"
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
    @collection = Collection.find(params[:id])
    erb :'/collections/edit_collection'
  end

  delete '/collections/:id/delete' do
    @collection = Collection.find(params[:id])
    # add a pop up confirmation box before deleting
    if logged_in? && user_collection_valid?
      @collection.destroy
      flash[:message] = "Collection deleted"
      redirect to "/users/#{current_user.slug}"
    else
      flash[:message] = "You cannot edit another user's collection"
      redirect to "/users/#{current_user.slug}"
    end
  end

end
