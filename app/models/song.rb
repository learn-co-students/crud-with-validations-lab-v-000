class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, :if => :released?
  validates :artist_name, presence: true
end
