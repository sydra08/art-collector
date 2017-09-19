class ArtworksController < ApplicationController

  get '/artworks' do
    erb :'/artworks/artworks'
  end

  post '/artworks' do
    binding.pry
    @collection = Collection.find(session[:collection])
    # @collection = Collection.find(params[:collection_id])
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
        flash[:message] = "Artwork successfully added to your collection"
        redirect to "/collections/#{@collection.id}"
      else
        flash[:message] = "There was an error processing your request"
        redirect to '/artworks/new'
      end
    else
      # redirect back to the collection you were looking at? or just back to the new artwork page?
      flash[:message] = "That artwork already exists"
      redirect to "/collections/#{@collection.id}"
    end
 end

 get '/artworks/new' do
  if logged_in?
    binding.pry
    @collection = Collection.find(session[:collection])
    # @collection = Collection.find(params[:collection_id])
    if current_user.collection_ids.include?(@collection.id)
      erb :'/artworks/new_artwork'
    else
      flash[:message] = "You cannot edit someone else's collection"
      redirect to "/users/#{current_user.slug}"
    end
   else
     flash[:message] = "You must be logged in to edit a collection"
     redirect to '/'
   end
 end

 get '/artworks/:id' do
   @artwork = Artwork.find(params[:id])
   erb :'/artworks/show_artwork'
 end

 delete '/artworks/:id/remove' do
  #  removes an artwork from a collection
  binding.pry
  @collection = Collection.find(session[:collection])
  # @collection = Collection.find(params[:collection_id])
  @artwork = Artwork.find(params[:id])
  # binding.pry
  if current_user.collection_ids.include?(@collection.id)
    # if the collection belongs to the user
    @collection.artworks.delete(@artwork)
    # deletes it from the collection but not the database
    flash[:message] = "Artwork successfully removed from your collection"
    redirect to "/collections/#{@collection.id}"
  else
    flash[:message] = "You cannot edit someone else's collection"
    redirect to "/users/#{current_user.slug}"
  end
 end

end
