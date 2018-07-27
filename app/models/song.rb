class Song < ActiveRecord::Base
  validates :title, presence: true 
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }
  
  validates :released, inclusion: { in: [true, false] }
  validates :released, exclusion: { in: [nil] }
  

 
  validates :release_year, presence: true, if: Proc.new { |a| a.released == true }
  validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.current.year.to_i }, if: Proc.new { |a| a.released == true }
  
  validates :artist_name, presence: true 
  validates :genre, presence: true 
end
