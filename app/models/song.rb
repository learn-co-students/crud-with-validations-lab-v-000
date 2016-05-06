class Song < ActiveRecord::Base
  validates :title, :artist_name, :genre, presence: true
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: {less_than_or_equal_to: 2016}


end
