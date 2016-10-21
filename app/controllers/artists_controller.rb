require './lib/music_from_api'


class ArtistsController < ApplicationController
  def index
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
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    MusicFromApi.new(data)
  end

  private

  def artist_params
    params.require(:artist).permit(:title, :genre)
  end


end
