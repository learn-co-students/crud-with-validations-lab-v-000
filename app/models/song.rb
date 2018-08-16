class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year}
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released?
  validate :release_year_cannot_be_greater_current_year 

  def released?
    self.released
  end

  def release_year_cannot_be_greater_current_year
    if release_year
      if release_year > Time.now.year
        errors.add(:release_year, "Must be less than or equal to the current year")
      end
    end
  end
end
