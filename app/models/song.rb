class Song < ActiveRecord::Base
  validates :title, presence: true
  validates_uniqueness_of :title, scope: :release_year
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released?
  validate :less_than_or_equal_current_year?, if: :released?

  def less_than_or_equal_current_year?
    if (release_year == nil || release_year > Date.today.year)
      errors.add(:release_year, "must be less than or equal to the current year")
    end
  end
end
