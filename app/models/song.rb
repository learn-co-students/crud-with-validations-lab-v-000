class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :not_a_repeat, :release_date_stipulations

  def not_a_repeat
    if Song.exists?(:title => self.title, :release_year => self.release_year)
      errors.add(:title, "Cannot be repeated by the same artist in the same year")
    end
  end

  def release_date_stipulations
    time = Time.now
    unless self.released == false
      if self.release_year == nil
        errors.add(:release_year, "Song is invalid without release year when released is true")
      elsif self.release_year > time.year
        errors.add(:release_year, "Song is invalid when the release year is in the future")
      end
    end
  end

end
