class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :release_year, message: "has already been released this year"}
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released, numericality: { only_integer: true, less_than_or_equal_to: 2019, allow_nil: true }
end
