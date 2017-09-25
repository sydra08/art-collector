class ArtworksController < ApplicationController

  get '/artworks' do
    erb :'/artworks/artworks'
  end

  post '/artworks' do
    if user_collection_valid?
      if !params[:artwork_id].empty?

        @artwork = Artwork.find(params[:artwork_id])
        if !current_collection.artworks.include?(@artwork)
          current_collection.artworks << @artwork

          flash[:message] = "#{@artwork.name} was successfully added to your collection"
          redirect to "/collections/#{current_collection.id}"
        else
          flash[:message] = "#{@artwork.name} is already in your collection"
          redirect to "/collections/#{current_collection.id}"
        end

      elsif !params[:artwork].empty?

        @artwork = Artwork.find_or_create_by(name: params[:artwork][:name]) do |a|
          a.year = params[:artwork][:year] unless params[:artwork][:year] == ""
        end

        if !params[:artwork][:artist].empty?
          @artist = Artist.find_or_create_by(name: params[:artwork][:artist])
          if @artist.invalid? || (@artwork.artist != @artist && @artwork.artist != nil)
            flash[:message] = "There was an error processing your request: #{@artist.errors[:name][0]}"
            # add error in for if you try to edit an already created artwork
            redirect to '/artworks/new'
          end
          @artist.artworks << @artwork
        end

        if @artwork.valid?
          if !current_collection.artworks.include?(@artwork)
            current_collection.artworks << @artwork
            flash[:message] = "#{@artwork.name} was successfully added to your collection"
            redirect to "/collections/#{current_collection.id}"
          else
            flash[:message] = "#{@artwork.name} is already in your collection"
            redirect to '/artworks/new'
          end
        else
          # if the artwork isn't valid
          flash[:message] = "There was an error processing your request: #{@artwork.errors[:name][0]}"
          redirect to '/artworks/new'
        end
      end
    else
      # if you try to edit someone else's collection
      flash[:message] = "You cannot edit someone else's collection"
      redirect to "/users/#{current_user.slug}"
    end
  end

  get '/artworks/new' do
    if logged_in?
      if user_collection_valid?
        @available_artworks =  Artwork.all.select{|a| !current_collection.artworks.include?(a)}
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
