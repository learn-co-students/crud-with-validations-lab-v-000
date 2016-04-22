class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validate :release_year_present_if_released, :release_year_cannot_be_in_future

  def release_year_present_if_released

    if released
      if !release_year.present?
          errors.add(:release_year, "release year must be present if released")
      end
    end
  end

  def release_year_cannot_be_in_future
    current_year = Date.today.year
    if release_year.present?
      if release_year > current_year
          errors.add(:release_year, "Release year cannot be in the future")
      end
    end
  end

end
