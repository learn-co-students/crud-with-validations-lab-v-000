
class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, length: {maximum: Date.today.year}
  validate :has_release_year?
  validate :same_song_made?
  validate :release_year_future?

  def release_year_future?
    if release_year
      if release_year > Date.today.year
      errors.add(:release_year, "Must not be a date in the future.")
      end
    end
  end


  def same_song_made?
    @songs = Song.all
    @songs.each do |song|
      if song.artist_name == self.artist_name && song.release_year == self.release_year && song.title == self.title
        errors.add(:title, "Already have a song with same artist & release year.")
      end
    end
  end

  def has_release_year?
    if self.released
      if release_year == nil
        errors.add(:release_year, "Must have a release date.")
      end
    end
  end

end
