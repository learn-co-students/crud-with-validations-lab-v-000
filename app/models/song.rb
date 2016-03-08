class Song < ActiveRecord::Base

  validates :title, presence: true, uniqueness: {scope: :release_year}
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, if: "!release_year.nil?"
  validates :artist_name, presence: true

end
