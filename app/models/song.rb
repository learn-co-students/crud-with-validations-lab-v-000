class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [ true, false ] }
  validates :artist_name, presence: true
  validates :genre, presence: true
  validates :release_year, presence: true
  validates :release_year, numericality: { less_than_or_equal_to: Time.current.year, only_integer: true }
end
