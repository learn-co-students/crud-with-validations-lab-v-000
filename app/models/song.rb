class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, :artist_name, uniqueness: true
  validates_presence_of :release_year,  if: :released
  validates :release_year, numericality: { :less_than_or_equal_to => 2016 }


   
end

