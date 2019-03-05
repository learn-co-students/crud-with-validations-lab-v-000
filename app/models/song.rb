class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :release_year, message: "Cannot be repeated by the same artist in the same year"}
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, numericality: {less_then_or_equal_to: Date.today.year}, presence: true, if: :released
  validates :artist_name, presence: true
end
