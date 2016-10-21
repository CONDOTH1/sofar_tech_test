class MusicFromApi

  def initialize(response)
    @response = response
    create
  end

  private

  def create
    @response.each do |video|
      guard_clauses(video)
    end
  end

  def guard_clauses(video)
    if video.include?("song")
      if video["song"].include?("artist")
        if video["song"].include?("city")
          artist(video)
          city(video)
          song(video)
          video(video)
        end
      end
    end
  end

  def artist(video)
    artist_title = video["song"]["artist"]["title"]
    Artist.create(title: artist_title) if !Artist.exists?(title: artist_title)
    find_artist(artist_title)
  end

  def find_artist(artist_title)
    @artist = Artist.find_by(title: artist_title)
  end

  def city(video)
    city_title = video["song"]["city"]["title"]
    City.create(city_title: city_title) if !City.exists?(city_title: city_title)
    find_city(city_title)
  end

  def find_city(city_title)
    @city = City.find_by(city_title: city_title)
  end

  def song(video)
    song_title = video["song"]["title"]
    @song = @artist.songs.create(title: song_title, rating: 5, city_id: @city.id)
  end

  def video(video)
    video_title = video["video_uid"]
    @song.create_video(video_title: video_title)
  end

end
