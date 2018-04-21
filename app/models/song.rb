class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, allow_nil: true
  validates :title, uniqueness: true, if: :not_duplicate?


  def released?
    self.released 
  end

  def not_duplicate?
    self.artist_name != Song.find_by(artist_name: self.artist_name) && self.release_year != Song.find_by(release_year: self.release_year)
  end

end







