class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: :released
  validate :release_year_not_future
  validate :no_duplicate_song

  def release_year_not_future
    if release_year && release_year > Date.today.year
      errors.add(:release_year, "can't be in the future")
    end
  end

  def no_duplicate_song
    song = Song.find_by(title: title)
    if song && song.release_year == release_year && song.id != id
      errors.add(:title, "can't be released twice in the same year")
    end
  end
end
