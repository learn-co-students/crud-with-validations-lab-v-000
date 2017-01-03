class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  

  validates :release_year, numericality: { less_than_or_equal_to: Time.new.year }


end
