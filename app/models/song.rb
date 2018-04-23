class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released, presence: true
  validate :release_year_cannot_be_in_future
  validate :same_song_same_year

  def release_year_cannot_be_in_future
    if release_year.present? && release_year > Time.current.year
      errors.add(:release_year, "can't be in the future")
    end
  end

  def same_song_same_year
    song = Song.find_by(title: title)
    if song && song.release_year == release_year
      errors.add(:release_year, "song can't be release twice in same year")
    end
  end
end
