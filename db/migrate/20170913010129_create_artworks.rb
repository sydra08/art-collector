class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :name
      t.integer :artist_id 
      t.integer :year
    end
  end
end
