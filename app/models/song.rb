class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false] }
  validates :artist_name, presence: true
  validate :same_artist_year
  validate :check_release_year

  def same_artist_year
    artist_songs = []
    Song.all.each do |song|
      if song.artist_name == artist_name
        artist_songs << song
      end
    end
    if artist_songs.detect{|s| s.release_year == release_year}
      errors.add(:title, "Error message")
    end
  end

  def check_release_year
    if released
      if !release_year || release_year == ""
        errors.add(:release_year, "Release year cannot be blank")
      elsif release_year > Date.today.year
        errors.add(:release_year, "Release year cannot be greater than current year")
      end
    end
  end

end
