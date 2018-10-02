class Song < ActiveRecord::Base
  validates :title, presence: true 
  validates :released, inclusion: { in: [true, false] }
  validates :title, uniqueness: { scope: :release_year,
    message: "Same song name cannot be released in the same year" }
  validate :future_release_year
  validate :release_presence
  validates :artist_name, presence: true 
  validates :genre, presence: true 
  
  def future_release_year
    if self.release_year != nil && Time.new.year < self.release_year 
      errors.add(:release_year, "Release Year Cannot Be In The Future")
    end 
  end 
    
  def release_presence
    if self.released == true && self.release_year == nil 
      errors.add(:release_year, "Release Year Required If Song Has Been Released")
    end 
  end 
  

end
