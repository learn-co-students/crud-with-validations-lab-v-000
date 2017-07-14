class Song < ActiveRecord::Base
  validates :title, {presence: true, uniqueness: true}
  validates :artist_name, presence: true
  validate :has_release_year_if_released, :release_year_cannot_be_in_the_future

  def has_release_year_if_released
    if released == true && !release_year.present?
      errors.add(:release_year, "must have release year")
    end
  end

  def release_year_cannot_be_in_the_future
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "can't be in the future")
    end
  end

end
