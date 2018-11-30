class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released
  validate :release_year_cannot_be_past
  # validates :artist_name, :release_year, uniqueness: true

  def release_year_cannot_be_past
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "Must be less than or equal to the current year")
    end
  end


end
