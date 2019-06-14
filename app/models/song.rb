class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :year,
    message: "A song title cannot be repeated by the same artist in the same year." }
  validates :released, presence: true, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released == true, numericality: { less_than_or_equal_to: Time.now.year}
  validates :artist_name, presence: true
end
