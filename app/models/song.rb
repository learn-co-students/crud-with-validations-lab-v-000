class Song < ActiveRecord::Base
  validates :title, presence: true 
  validates :title, uniqueness: { scope: [:artist_name, :released_year] }
  
  validates :released, inclusion: { in: [true, false] }
  validates :released, exclusion: { in: [nil] }
  
  validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.current.year.to_i }
  validates :release_year, presence: true if 
  
  validates :artist_name, presence: true 
  validates :artist_name, format: { with: /\A[a-zA-Z]+\z/ }
end
