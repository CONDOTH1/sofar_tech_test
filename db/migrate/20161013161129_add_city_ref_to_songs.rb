class AddCityRefToSongs < ActiveRecord::Migration[5.0]
  def change
    add_reference :songs, :city, foreign_key: true
  end
end
