class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :movement
      t.string :location
      t.integer :birth_year
      t.boolean :alive
    end
  end
end
