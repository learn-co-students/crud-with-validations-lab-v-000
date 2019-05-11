class Song < ApplicationRecord
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: :release_year,
    message: "Songs cannot have the same name in a year" }

  validates :released, inclusion: { in: [true, false] }
  validates :released, exclusion: { in: [nil] }

  validates :release_year, presence: true, if: :is_released?
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, if: :is_released?

  def is_released?
    released == true
  end

end
