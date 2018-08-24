class Song < ActiveRecord::Base
  validates :artist_name, presence: true
  validates :title, presence: true
  validates :released, presence: true
  validate :released_year_validation

  def released_year_validation
    if released.present? && (released == true) && !release_year.present?
      errors.add(:release_year, "release year cannot be blank if released.")
    elsif release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "release year cannot be in the future.")
    end
  end
end
