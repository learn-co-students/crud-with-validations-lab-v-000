class Song < ApplicationRecord
  validates :title, length: {minimum: 1}
  validates :title, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, length: {minimum: 1}
    
  with_options if: :released? do |song|
    song.validates :release_year, length: {minimum: 1}
    song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
  end
  
  def released?
    released == true
  end
end
