class ArtworksController < ApplicationController

  get '/artworks' do
    @artworks = Artwork.all
    erb :'/artworks/artworks'
  end
  #
  # get '/collections/:collection_id/artworks' do
  #   if @collection = Collection.find_by(id: params[:collection_id])
  #     @artworks = @collection.artworks
  #     erb :'/artworks/artworks'
  #   else
  #     # TODO add error message and redirect
  #   end
  # end

  post '/artworks' do
    if user_collection_valid?
      # don't need to check if field is empty bc form has required field
      @artwork = Artwork.find_or_create_by(name: params[:artwork][:name]) do |a|
        a.year = params[:artwork][:year] unless params[:artwork][:year] == ""
      end

      if @artwork.valid? && !current_collection.artworks.include?(@artwork)

        if @artwork.artist_id == nil && !params[:artwork][:artist].empty?
          # only adds an artist if the artwork doesn't have one already and the artist param isn't empty
          @artist = Artist.find_or_create_by(name: params[:artwork][:artist])
          if @artist.valid?
            @artist.artworks << @artwork
          end
        end

        current_collection.artworks << @artwork
        flash[:message] = "#{@artwork.name} was successfully added to your collection"
        redirect to "/collections/#{current_collection.id}"

      else
        if !@artwork.errors[:name][0].nil?
          # shows up if you try to add an artwork with the same name as an existing one, but not matching case
          flash[:message] = "Error: #{@artwork.errors[:name][0]}"
        else
          flash[:message] = "Error: #{@artwork.name} is already in your collection"
        end
        redirect to '/artworks/new'
      end

    else
      # if you try to edit someone else's collection
      flash[:message] = "Error: You cannot edit someone else's collection"
      redirect to "/users/#{current_user.slug}"
    end
  end

  get '/artworks/new' do
    authenticate_user
    if user_collection_valid?
      @available_artworks =  Artwork.all.select{|a| !current_collection.artworks.include?(a)}
      erb :'/artworks/new_artwork'
    else
      flash[:message] = "Error: You cannot edit someone else's collection"
      redirect to "/users/#{current_user.slug}"
    end
  end

  get '/artworks/:id' do
    @artwork = Artwork.find(params[:id])
     erb :'/artworks/show_artwork'
  end

  delete '/artworks/:id/remove' do
    authenticate_user
    @artwork = Artwork.find(params[:id])
    if user_collection_valid?
      # if the collection belongs to the user
      current_collection.artworks.delete(@artwork)
      # deletes it from the collection but not the database
      flash[:message] = "#{@artwork.name} successfully removed from your collection"
      redirect to "/collections/#{current_collection.id}"
    else
      flash[:message] = "Error: You cannot edit someone else's collection"
      redirect to "/users/#{current_user.slug}"
    end
  end

end
