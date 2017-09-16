class ArtistsController < ApplicationController

  get '/artists' do
    erb :'/artists/artists'
  end

  get '/artists/new' do
    erb :'/artists/new_artist'
  end

  post '/artists' do
    #create new artist here if it doesn't already exist
    redirect to "/artists/#{@artist.slug}"
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
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/edit_artist'
  end

end
