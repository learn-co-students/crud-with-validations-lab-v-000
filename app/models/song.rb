class Song < ActiveRecord::Base
  validates :title,  :artist_name, :genre, presence: true
  validates :title, uniqueness: { 
    scope: [:release_year, :artist_name], 
    message: "only one per year" 
  }
   with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { 
      less_than_or_equal_to: Date.today.year 
    } 
  end

end
