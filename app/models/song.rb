class Song < ActiveRecord::Base
  validates :title, presence: true
  validates_uniqueness_of :title, scope: [:artist_name, :release_year]
  validates :released, inclusion: { in: %w(true false), message: "%{value} is not a valid option"}
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: { less_than: Time.now.year }
  validates :artist_name, presence: true
end
