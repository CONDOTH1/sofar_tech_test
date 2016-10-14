class CitiesController < ApplicationController

  def new
    p "======================city1"
    @song = Song.find(params[:song_id])
    @city = City.new
  end

  def create

    @song = Song.find(params[:song_id])
    @song.cities.create(city_params)
  end

  def show
    p "======================city3"

    # p "=============#{city_id.inspect}here"
    @city = City.find(city_id)
    redirect_to artists_path
  end

private

def city_params
  params.require(:city).permit(:city_title)
end

end
