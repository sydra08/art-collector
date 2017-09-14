class CollectionsController < ApplicationController

  get '/collections/new' do
    erb :'/collections/create_collection'
  end

  get '/collections/:id' do
    @collection = Collection.find_by_slug(params[:id])
    erb :'/collections/show_collection'
  end

  get '/collections/:id/edit' do
    @collection = Collection.find(params[:id])
    erb :'/collections/edit_collection'
  end

end
