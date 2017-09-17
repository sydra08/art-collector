class ArtworksController < ApplicationController

  get '/artworks' do
    erb :'/artworks/artworks'
  end

  get '/artworks/:id' do
    @artwork = Artwork.find(params[:id])
    erb :'/artworks/show_artwork'
  end

  # get '/artworks/new' do
  #   if logged_in?
  #     erb :'/artworks/new_artwork'
  #   else
  #     # you must be logged in to do that
  #     redirect to '/artworks'
  #   end
  # end
  #
  # post '/artworks' do
  #   binding.pry
  #   @artwork = Artwork.find_by(name: params[:name])
  #   if @artwork == nil
  #     @artwork = Artwork.new(name: params[:name], year: params[:year])
  #     if !params[:artist].empty?
  #       @artist = Artist.find_or_create_by(name: params[:artist])
  #     end
  #     if @artwork.save
  #       @artist.artworks << @artwork
  #       redirect to "/artworks/#{@artwork.slug}"
  #     else
  #       # there was an error processing your request
  #       redirect to '/artworks/new'
  #     end
  #   else
  #     # that artwork already exists
  #     redirect to "/artworks/#{@artwork.slug}"
  #   end
  # end



  # patch '/artworks/:slug' do
  #   @artwork = Artwork.find_by_slug(params[:slug])
  #   binding.pry
  #   if !params[:name].empty?
  #     @artwork.name = params[:name]
  #   end
  #
  #   if !params[:year].empty?
  #     @artwork.year = params[:year]
  #   end
  #
  #   if params[:artist] != @artwork.artist.name
  #     @artist = Artist.find_or_create_by(name: params[:artist])
  #     @artist.artworks << @artwork
  #   end
  #
  #   if @artwork.save
  #     redirect to "/artworks/#{@artwork.slug}"
  #   else
  #     # there was an error processing your request
  #     redirect to "/artworks/#{@artwork.slug}"
  #   end
  #
  # end
  #
  # get '/artworks/:slug/edit' do
  #   @artwork = Artwork.find_by_slug(params[:slug])
  #   if logged_in?
  #     erb :'/artworks/edit_artwork'
  #   else
  #     # you must be logged in to do that
  #     redirect to "/artworks/#{@artwork.slug}"
  #   end
  # end

end
