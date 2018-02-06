class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year}
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validate :release_year_when_released?, :release_year_in_future

  def release_year_when_released?
    if released && !release_year
      errors.add(:release_year, "release year is required")
    end
  end

  def release_year_in_future
    if release_year && release_year > Date.today.year
      errors.add(:release_year, "year has to have passed")
    end
  end
end
