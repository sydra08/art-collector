class ChangeArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :movement, :string
    remove_column :artists, :location, :string
    remove_column :artists, :birth_year, :integer
    remove_column :artists, :alive, :boolean
  end
end
