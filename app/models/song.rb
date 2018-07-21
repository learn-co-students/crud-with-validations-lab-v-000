class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, if: :released?
  validates :release_year, presence: true, if: :released?
  validate :twice

  def released?
    self.released
  end

  def twice
    if self.class.all.any? do |song|
        ((self.artist_name == song.artist_name) && (self.title == song.title) && (self.release_year == song.release_year))
      end
      errors.add(:double_release, "Artist can't release the same song twice in a year")
    end
  end

end
