class Song < ActiveRecord::Base
  validates_presence_of :title
  validates :title, uniqueness: {scope: [:release_year, :artist_name]}
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, if: :released?
  validates_presence_of :artist_name
end
