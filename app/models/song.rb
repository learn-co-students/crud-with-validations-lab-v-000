class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  # validates :release_year_cannot_be_greater_than_current_year
  validates :artist_name, presence: true

  def release_year_cannot_be_greater_than_current_year
    if Date.today.year < release_year
      errors.add(:release_year, "can't be greater than current year")
    end
  end
end
