class AddSongRefToVideos < ActiveRecord::Migration[5.0]
  def change
    add_reference :videos, :song, foreign_key: true
  end
end
