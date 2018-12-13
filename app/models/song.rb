class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year]}
  validates :released, exclusion: { in: [nil] }
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.current.year }, if: :released
  validates :artist_name, presence: true
end
