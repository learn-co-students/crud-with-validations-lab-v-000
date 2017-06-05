class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: {scope: :release_year}
  validates :released, inclusion: {in: [true, false]}
  validates :released, exclusion: {in: [nil]}
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: {only_integer: true, less_than_or_equal_to: 2017}, if: :released
end
