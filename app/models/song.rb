class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, numericality: {less_than_or_equal_to: Date.today.year}, if: :released
  validates :artist_name, presence: true
  validate :stale_title?, if: :released

  def stale_title?
    if self.class.all.any?{|song| song.artist_name == artist_name && song.title == title && song.release_year == release_year}
      errors.add(:title, "A title cannot be released by the same artist in the same year")
    end
  end

end
