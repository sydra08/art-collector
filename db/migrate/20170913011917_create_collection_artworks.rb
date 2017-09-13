class CreateCollectionArtworks < ActiveRecord::Migration
  def change
    create_table: collection_artworks do |t|
      t.integer :collection_id
      t.integer :artwork_id
    end
  end
end
