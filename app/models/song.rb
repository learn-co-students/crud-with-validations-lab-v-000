class Song < ActiveRecord::Base

  validates :title, :artist_name, :genre, :release_year,  presence: :true 
  validates :title, uniqueness: :true 
  # validates :release_year, presence: :true if s.released
  


end
