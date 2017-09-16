class CollectionsController < ApplicationController

  get '/collections/new' do
    if logged_in?
      erb :'/collections/create_collection'
    else
      # you must be logged in to do that
      redirect '/login'
    end
  end

  post '/collections' do
    @collection = Collection.new(name: params[:collection][:name], artwork_ids: params[:collection][:artwork_ids])

    # create new artwork and artist
    @artwork = Artwork.find_or_initialize_by(name: params[:artwork][:name], year: params[:artwork][:year])
    @artwork.artist = Artist.find_or_create_by(name: params[:artwork][:artist])
    @artwork.save

    # add artwork to the collection
    @collection.artworks << @artwork
    @collection.save
    binding.pry
    redirect to "/collections/#{@collection.id}"
  end

  get '/collections/:id' do
    @collection = Collection.find(params[:id])
    erb :'/collections/show_collection'
  end

  get '/collections/:id/edit' do
    @collection = Collection.find(params[:id])
    erb :'/collections/edit_collection'
  end

end
