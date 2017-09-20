class ArtworksController < ApplicationController

  get '/artworks' do
    erb :'/artworks/artworks'
  end

  post '/artworks' do
    binding.pry
    if user_collection_valid?

      if !params[:artist_name].empty?
        @artist = Artist.find_or_create_by(name: params[:artist_name])
        if @artist.invalid?
          flash[:message] = "There was an error processing your request: #{@artist.errors[:name][0]}"
          redirect to '/artworks/new'
        end
      elsif !params[:artist].empty? && params[:artist] != "unknown"
        @artist = Artist.find_or_create_by(name: params[:artist])
      end

      if !params[:artwork_name].empty?
        @artwork = Artwork.find_or_create_by(name: params[:artwork_name], year: params[:artwork_year])
      else
        @artwork = Artwork.find_or_create_by(name: params[:artwork])
      end
      # the search could also treat names that start with "the" to be the same
      if @artwork.valid?
        if @artist != nil && @artwork.artist != @artist
          # this needs to be fixed so that you look for the artist
          flash[:message] = "Sorry, you cannot change the artist of an existing artwork"
          redirect to '/artworks/new'
        elsif @artist != nil
          @artist.artworks << @artwork
        end
        current_collection.artworks << @artwork
        current_collection.save
        flash[:message] = "#{@artwork.name} was successfully added to your collection"
        redirect to "/collections/#{current_collection.id}"
      else
        flash[:message] = "There was an error processing your request: #{@artwork.errors[:name][0]}"
        redirect to "/collections/#{current_collection.id}"
      end
    else
      flash[:message] = "You cannot edit someone else's collection"
      redirect to "/users/#{current_user.slug}"
    end
  end

 get '/artworks/new' do
  if logged_in?
    if user_collection_valid?
      @new_artworks =  Artwork.all.select{|a| !current_collection.artworks.include?(a)}
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
  @artwork = Artwork.find(params[:id])
  if user_collection_valid?
    # if the collection belongs to the user
    current_collection.artworks.delete(@artwork)
    # deletes it from the collection but not the database
    flash[:message] = "#{@artwork.name} successfully removed from your collection"
    redirect to "/collections/#{current_collection.id}"
  else
    flash[:message] = "You cannot edit someone else's collection"
    redirect to "/users/#{current_user.slug}"
  end
 end

end
