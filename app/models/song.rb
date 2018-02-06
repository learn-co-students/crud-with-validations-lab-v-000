class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, current_or_past_year: true, presence: true, if: :released?
  validates :artist_name, presence: true
  validate :once_per_artist_per_year

  def once_per_artist_per_year
    song = Song.find_by(artist_name: self.artist_name, release_year: self.release_year)
    if song && song != self
      errors.add(:title, "can't be released by the same artist in the same year")
    end
  end
end
