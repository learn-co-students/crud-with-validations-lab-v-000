class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: {scope: [:artist_name, :release_year]}
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, presence: true, if: :released
  validates :release_year, length: {maximum: (Time.now.year)}
end
