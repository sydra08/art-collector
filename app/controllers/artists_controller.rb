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
        # what does this do if it doesn't save?
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
    @artist = Artist.find_by_slug(params[:slug])
    # is there a better way to do this?
    if !params[:artist][:name].empty?
      @artist.name = params[:artist][:name]
    end

    if !params[:artist][:year].empty?
      @artist.birth_year = params[:artist][:year]
    end

    if !params[:artist][:location].empty?
      @artist.location = params[:artist][:location]
    end

    if !params[:artist][:movement].empty?
      @artist.movement = params[:artist][:movement]
    end

    if !params[:artist][:alive].empty?
      @artist.alive = params[:artist][:alive]
    end

    @artist.save
    redirect to "/artists/#{@artist.slug}"
  end

  get '/artists/:slug/edit' do
    if logged_in?
      @artist = Artist.find_by_slug(params[:slug])
      erb :'/artists/edit_artist'
    else
      # flash msg - that they need to be logged in to do that
      redirect to "/artists/#{@artist.slug}"
    end
  end

end
