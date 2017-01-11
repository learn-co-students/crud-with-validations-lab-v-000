class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :artist_name, presence: true
  validate :release_year_present_with_released?,
    :release_year_less_than_or_equal_to_current_year?

  def release_year_present_with_released?
    if released && !release_year?
      errors.add(:release_year, "must be set for a released song")
    end
  end

  def release_year_less_than_or_equal_to_current_year?
    if release_year? && release_year > Date.today.year
      errors.add(:release_year, "cannot be in the future")
    end
  end
end
