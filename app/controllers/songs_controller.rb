class SongsController < ApplicationController

  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @artist.songs.create(song_params)
    redirect_to '/artists'
  end

  private

  def song_params
    params.require(:song).permit(:title, :rating)
  end

end