class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true, if: :release_year, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validate :is_released
  validate :current_year

  def current_year
    if release_year.present? && release_year > Date.today.year
        errors.add(:release_year, "Can't be in the future")
    end
  end

  def is_released
    if released == true && release_year == nil
        errors.add(:release_year, "Can't be blank if released")
    end
  end
end