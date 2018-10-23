class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year}
  validates :artist_name, presence: true
  validates :release_year, numericality: { less_than_or_equal_to: 2018}, if: :released
  validates :release_year, presence: true, if: :released
end
