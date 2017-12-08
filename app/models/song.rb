class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :artist_name, presence: true
  
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.today.year }
  end
  
  private 
  
  def released?
    released
  end
  
end
