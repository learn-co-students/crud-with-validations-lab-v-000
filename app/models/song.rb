class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :release_year}
  validates :release_year,
            presence: true, numericality: { less_than_or_equal_to: Date.today.year }, if: :released
end
