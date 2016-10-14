require './lib/web_helper'


class ArtistsController < ApplicationController
  def index
    # import
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path
    else
      render 'new'
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
    redirect_to('/artists')
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    flash[:notice] = 'artist deleted successfully'
    redirect_to '/artists'
  end


  helper_method :find_city

  def find_city(city_id)
    city = City.find(city_id)
    @city = city.city_title
  end

  def import
    music_api
    redirect_to '/artists'
  end

  def music_api
    url = 'https://s3-eu-west-1.amazonaws.com/sofar-eu-1/video_data.json'
    uri = URI(url)
    @response = Net::HTTP.get(uri)
    @data = JSON.parse(@response)
    @data.each do |video|
      video_param = video["video_uid"]
        if video.include?("song")
          if video["song"].include?("artist")
            if video["song"].include?("city")

              artist = video["song"]["artist"]["title"]
              new_artist = Artist.create(title: artist) if !Artist.exists?(title: artist)

              city = video["song"]["city"]["title"]
              new_city = City.create(city_title: city) if !City.exists?(city_title: city)

              find_artist = Artist.find_by(title: artist)
              find_city = City.find_by(city_title: city)

              music = video["song"]["title"]
              new_song = find_artist.songs.create(title: music, rating: 2, city_id: find_city.id)

              new_video = new_song.create_video(video_title: video_param)
            end
          end
        end
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:title, :genre)
  end


end
