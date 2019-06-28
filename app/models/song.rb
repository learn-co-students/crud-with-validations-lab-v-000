class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validate :released?, :future_release?


  def released?
    if self.released && self.release_year.nil?
      errors.add(:release_year, "can not be nil")
    end
  end

  def future_release?
    if self.release_year && self.release_year > Date.today.year
      errors.add(:release_year, "coming soon")
    end
  end
end
