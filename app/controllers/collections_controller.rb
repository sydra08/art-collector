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
    # if the artwork params aren't nil, create the artwork
    # if !params[:artwork][:name].empty?
    #   @artwork = Artwork.find_or_initialize_by(name: params[:artwork][:name], year: params[:artwork][:year])
    #   # if an artist was given, create the artist
    #   if params[:artwork][:artist].empty?
    #     @artwork.artist = Artist.find_or_create_by(name: params[:artwork][:artist])
    #   end
    #   @artwork.save
    #   @collection.artworks << @artwork
    # end

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
    erb :'/collections/show_collection'
  end

  patch '/collections/:id' do
    @collection = Collection.find(params[:id])
    if !params[:collection][:name].empty?
      @collection.name = params[:collection][:name]
    end
    @collection.artwork_ids = params[:collection][:artwork_ids]
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
    if logged_in? && current_user.id == @collection.id
      @collection.destroy
      flash[:message] = "Collection deleted"
      redirect to "/users/#{@user.slug}"
    else
      flash[:message] = "You cannot edit another user's collection"
      redirect to '/'
    end
  end

end
