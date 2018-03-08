class Song < ActiveRecord::Base
  validates_presence_of :title, :artist_name
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, numericality: { less_than: Date.today.year }, presence: true, unless: Proc.new { |a| a.released == false } 
  validate :existing_song
  
  def existing_song
    if Song.find_by(title: self.title, release_year: self.release_year, artist_name: self.artist_name)
    errors.add(:title, "song can't be released by same artist twice in a year")
    end
  end
end
# self.attributes.except("id", "created_at", "updated_at")