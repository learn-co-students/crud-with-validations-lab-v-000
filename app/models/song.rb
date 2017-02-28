class Song < ActiveRecord::Base

  validates :title, presence: true, uniqueness: {scope: [:artist_name, :release_year]}
  validates :artist_name, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :released?
  validate :release_year_not_after_current_year

  def release_year_not_after_current_year
    if release_year.present? && release_year > Time.current.year
      errors.add(:release_year, "cannot be after current year")
    end
  end

end
