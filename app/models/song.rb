class Song < ActiveRecord::Base
  # Must not be blank
  validates :title, presence: true

  # Cannot be repeated by the same artist in the same year
  validates :title, uniqueness: { scope: [:release_year, :artist_name]}

  # describes whether the song was ever officially released
  validates :released, inclusion: { in: [true, false] }

  # Must not be blank
  validates :artist_name, presence: true

  # If released is true must not be blank if
  # Must be less than or equal to the current year
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?
  
end
