class AddGenreToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :genre, :text
  end
end
