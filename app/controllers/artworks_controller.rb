class ArtworksController < ApplicationController

  get '/artworks' do
    erb :'/artworks/artworks'
  end

  get '/artworks/:slug' do
    @artwork = Artwork.find_by_slug(params[:slug])
    erb :'/artworks/show_artwork'
  end

end
