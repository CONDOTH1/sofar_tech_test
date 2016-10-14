class VideosController < ApplicationController

  def new
    @song = Song.find(params[:song_id])
    @video = Video.new
  end

  def create
    @song = Song.find(params[:song_id])
    @song.create_video(video_params)
    redirect_to '/artists'
  end

  private

  def video_params
    params.require(:video).permit(:video_title)
  end

end
