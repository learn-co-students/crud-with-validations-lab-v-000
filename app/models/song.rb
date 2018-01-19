class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :artist_name, presence: true
  validates :release_year, presence: true, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year }, if: 'released'
end
