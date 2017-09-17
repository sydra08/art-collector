class ArtworksController < ApplicationController

  get '/artworks' do
    erb :'/artworks/artworks'
  end

  post '/artworks' do
    # binding.pry
    @collection = Collection.find(params[:collection_id])
    @artwork = Artwork.find_by(name: params[:name])
    # the search should be case insensitive
    # the search could also treat names that start with "the" to be the same
    if @artwork == nil
      @artwork = Artwork.new(name: params[:name], year: params[:year])
      if !params[:artist].empty?
        @artist = Artist.find_or_create_by(name: params[:artist])
      end
      if @artwork.save
        @artist.artworks << @artwork
        @collection.artworks << @artwork
        # but maybe you want to add the artwork in a better way so that the system isn't holding onto the whole list that gets returned...maybe custom method?
        # why didn't the artwork show up on the page?
        redirect to "/collections/#{@collection.id}"
      else
        # there was an error processing your request
        redirect to '/artworks/new'
      end
    else
      raise params.inspect
      # that artwork already exists
      # redirect back to the collection you were looking at? or just back to the new artwork page?
      redirect to "/collections/#{@collection.id}"
    end
 end

 get '/artworks/new' do
   if logged_in?
     @collection = Collection.find(params[:collection_id])
     erb :'/artworks/new_artwork'
   else
     # you must be logged in to do that
     redirect to '/artworks'
   end
 end

 get '/artworks/:id' do
   @artwork = Artwork.find(params[:id])
   erb :'/artworks/show_artwork'
 end

end
