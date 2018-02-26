class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year,
    message: "Cannot be repeated by the same artist in the same year" }
  validates :artist_name, presence: true
  validates :release_year, presence: true, numericality: {less_than_or_equal_to: Date.today.year}, if: :released
  validates :released, inclusion: { in: [ true, false ] }
end
