class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :release_year_requirement

  def release_year_requirement
    duplicate = Song.find_by(title: self.title)
    if self.released && self.release_year.nil?
      errors.add(:release_year, "must have a release year if song is released.")
    elsif self.released && self.release_year > Date.today.year
      errors.add(:release_year, "cannot be released in the future.")
    elsif self.released && duplicate && duplicate.release_year == self.release_year
      errors.add(:release_year, "cannot release the same song in the same year.")
    end
  end
end
