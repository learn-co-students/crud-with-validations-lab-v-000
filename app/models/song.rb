class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year}
  validates :release_year, presence: true, if: :released?
  validate :release_year_is_in_the_past


  def released?
    released
  end

  def release_year_is_in_the_past
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "can't be in the future.")
    end
  end
end
