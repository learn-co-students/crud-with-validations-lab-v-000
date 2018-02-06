class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year] }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validate :release_year_optional_if_not_released

  def release_year_optional_if_not_released
    if released && !release_year || (release_year && release_year > Time.now.year)
      errors.add(:release_year, "year must be valid if song has been released")
    end
  end
end
