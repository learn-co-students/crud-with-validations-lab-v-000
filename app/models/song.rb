class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: :released?
  validate :release_year_cannot_be_in_the_future
  validate :cannot_release_song_twice_in_a_year

  def release_year_cannot_be_in_the_future
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "Can't be in the future")
    end
  end

  def cannot_release_song_twice_in_a_year
    song = Song.find_by(title: title, artist_name: artist_name)
    if !song.nil? && song.release_year == release_year
      errors.add(:release_year, "Can't release the same song twice in a year")
    end
  end

end
