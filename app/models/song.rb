class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "cannot be repeated by same artist in same year"
  }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :genre, presence: true
  validates :release_year, if: :released, numericality: { only_integer: true, less_than_or_equal_to: Date.today.year }
end
