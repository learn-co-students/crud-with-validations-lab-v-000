class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name]}
  validates :released, exclusion: { in: [nil] }
  validates :release_year, presence: true, numericality: {less_than: Time.now.year + 1}, if: "released == true"
  validates :artist_name, presence: true
end
