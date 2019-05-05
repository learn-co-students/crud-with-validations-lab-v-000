class Song < ApplicationRecord
  validates :title, presence: true
#  validates :title, uniqueness: true
  validate :invalid_without_release_year
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  #is valid without release year when released is false (FAILED - 3)

    def invalid_without_release_year
      if released == true && release_year = nil
        errors.add(:release_year, "must have a release year")
      end
    end


end
