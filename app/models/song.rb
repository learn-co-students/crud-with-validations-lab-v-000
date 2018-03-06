class Song < ActiveRecord::Base


  validates :title, presence: true, if :written_this_year?
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if :release
  validate :valid_year
  validates :artist_name, presence: true

  def written_this_year?
    @song = Song.find_by(title: self.title)
    if !@song.nil? && @song.artist_name == self.artist_name && @song.release_year == self.release_year
      false
    else
      true
    end
  end

  def valid_year
    self.release_year <= Time.now.year
  end

end
