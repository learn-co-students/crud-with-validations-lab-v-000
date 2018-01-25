class Song < ActiveRecord::Base
  validates :title, presence: true 
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: "released == true", inclusion: { in: 0..Date.today.year }  
  validates :artist_name, presence: true 
  validate :repeated 



  def repeated 
    if Song.find_by(title: title, artist_name: artist_name, release_year: release_year)
      errors.add(:artist_name, "Cannot repeat a song title by the same artist within a single year")
    end 
  end 
end 
