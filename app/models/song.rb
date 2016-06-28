class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :year, scope: :artist_name}
  validate :validate_release_year, :release_year_valid_date
  validates :artist_name, presence: true
  validates :genre, presence: true

  def validate_release_year
    if self.released == true && !self.release_year.present?
      errors.add(:require_release_year, "if released status is true, a release_year is required")
    end
  end

  def release_year_valid_date
    if self.release_year.present? && self.release_year > Date.today.year
      errors.add(:release_year_invalid, "release year must be less than or equal to the current year")
    end
  end

end
