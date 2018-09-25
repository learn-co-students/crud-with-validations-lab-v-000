class Song < ActiveRecord::Base
  #scope :artist_and_year -> { where(artist: )}
  validates :title, presence: true
  validates :title, uniqueness: { scope: :artist && :release_year,
    message: "cannot be repeated by the same artist in the same year" }
  validates :released, inclusion: {in: [true, false]}
  #validates :release_year, presence: true, if: :released
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}, if: :released
  validates :artist_name, presence: true
end
