class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :artist_name, presence: true
  validates :released, exclusion: { in: [nil] }
  validates :release_year, numericality: {less_than_or_equal_to: Time.new.year}, if: "released == true"
end
