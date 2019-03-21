class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :no_same_artist_year
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: {less_than_or_equal_to: Time.current.year, only_integer: true}, if: :released
  validates :artist_name, presence: true

  def no_same_artist_year
    if Song.all.find {|song| song != self && song.title == self.title && song.artist_name == self.artist_name && song.release_year = self.release_year }
      errors.add(:title, "Stop repeating yourself so often!!")
    else
      true
    end
  end
end
