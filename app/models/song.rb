class Song < ActiveRecord::Base
  validates :artist_name, presence: true
  validates :title, presence: true
  validates :release_year, numericality: {greater_than: Time.now.year}
  # Title cannot be repeated by same artist in the same year
  #
  #


end
