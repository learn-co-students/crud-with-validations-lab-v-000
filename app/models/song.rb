class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :released, inclusion: [true, false]
  validates :release_year, presence: true, unless: -> { released == false }
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, unless: -> { released == false }
  validates :artist_name, presence: true
end
