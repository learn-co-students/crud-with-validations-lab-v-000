class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in:[true, false]}
  validates :release_year, presence: true, if: :song_released?
  validate :valid_release_year?, if: :song_released?
  validates :artist_name, presence: true
  validate :song_already_made?

  def song_already_made?
    song_found = Song.find_by(title: self.title, artist_name: self.artist_name, release_year: self.release_year)
    errors.add(:song_made, "Song already made this year") if !song_found.nil? && song_found.id != self.id
  end

  def song_released?
    self.released
  end

  def valid_release_year?
    if self.release_year.nil?
      errors.add(:release_year, "Field cannot be blank")
    else 
      errors.add(:release_year,"Release year cannot be greater than the present year") if self.release_year >= Time.now.year
    end
  end
end
