class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: true
  validates :release_year, numericality: { less_than_or_equal_to: Date.current.year }
  validates :artist_name, presence: true
end
