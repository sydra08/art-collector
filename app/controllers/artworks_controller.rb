class ArtworksController < ApplicationController

  get '/artworks' do
    erb :'/artworks/artworks'
  end

  get '/artworks/:id' do
    @artwork = Artwork.find(params[:id])
    erb :'/artworks/show_artwork'
  end

end
