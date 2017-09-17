class ArtistsController < ApplicationController

  get '/artists' do
    erb :'/artists/artists'
  end

  get '/artists/new' do
    if logged_in?#users should only be allowed to access this if they are logged in
      erb :'/artists/new_artist'
    else
      # flash message - you must be logged in to create a new artist
      redirect to '/artists'
    end
  end

  post '/artists' do
    @artist = Artist.find_by(name: params[:name])
    if @artist == nil
      binding.pry
      @artist = Artist.new(name: params[:name], birth_year: params[:year], location: params[:location], movement: params[:movement], alive: params[:alive])
      if params[:artwork].empty?
        @artwork = Artwork.find_or_create_by(name: params[:artwork][:name], year: params[:artwork][:year])
        @artist.artworks << @artwork
      end
      if @artist.save
        redirect to "/artists/#{@artist.slug}"
      end
    else
      # flash msg - that artist already exists
      # artist page or artists page?
      redirect to '/artists'
    end
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show_artist'
  end

  patch '/artists/:slug' do
    # edit artist
    @artist = Artist.find_by_slug(params[:slug])

    redirect to "/artists/#{@artist.slug}"
  end

  get '/artists/:slug/edit' do
    #users should only be allowed to access this if they are logged in
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/edit_artist'
  end

end
