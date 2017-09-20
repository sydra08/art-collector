class ChangeArtists < ActiveRecord::Migration
  def change
    change_table :artists do |t|
      t.remove :movement, :location, :birth_year, :alive
    end
  end
end
