class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :release_year}
  validates :release_year, presence: true, if: :released
  validate :release_date_cannot_be_in_future

  def release_date_cannot_be_in_future
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "Cannot be in the future")
    end
  end

end
