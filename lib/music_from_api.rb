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
    video_param = video["video_uid"]
    if video.include?("song")
      if video["song"].include?("artist")
        if video["song"].include?("city")

          artist(video)

          city = video["song"]["city"]["title"]
          new_city = City.create(city_title: city) if !City.exists?(city_title: city)

          find_city = City.find_by(city_title: city)

          music = video["song"]["title"]
          new_song = @artist.songs.create(title: music, rating: 5, city_id: find_city.id)

          new_video = new_song.create_video(video_title: video_param)
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

end
