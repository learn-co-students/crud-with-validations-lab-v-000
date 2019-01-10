class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :duplicate
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, :if => :is_released?
  validate :future, unless: Proc.new { |a| a.release_year.blank? }

  def duplicate
    song = Song.find_by_title(self.title)
    if song && song.artist_name == self.artist_name && song.release_year == self.release_year
    errors.add(:title, "Song can't be duplicated by same artist in same year")
    end
  end

  def is_released?
    self.released == true
  end

  def future
    if self.release_year > 2019
      errors.add(:release_year, "Release date cannot be in future")
    end
  end

end
