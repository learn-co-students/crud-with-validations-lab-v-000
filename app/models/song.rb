class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in:[true, false]}
  validates :release_year, presence: true, if: :song_released?
  validate :valid_release_year?, if: :song_released?
  validates :artist_name, presence: true
  validate :song_already_made?

  def song_already_made?
    errors.add(:song_made, "Song already made this year") if !!Song.find_by(title: self.title, artist_name: self.artist_name, release_year: self.release_year)
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
