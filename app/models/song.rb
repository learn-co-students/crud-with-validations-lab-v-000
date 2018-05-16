class Song < ActiveRecord::Base
  validates :title, presence: true
  #validates :release_year, numericality: { less_than_or_equal_to: :released }
  validates :artist_name, presence: true
end
