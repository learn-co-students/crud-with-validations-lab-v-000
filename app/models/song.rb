class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :release_year, presence: true, if: :released
  validate :release_year_in_past?

  def release_year_in_past?
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "Can't be a future date")
    end
  end

end
