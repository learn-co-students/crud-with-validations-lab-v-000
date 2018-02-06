class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :release_year_exists_if_released
  validate :release_year_is_in_the_past
  validate :song_is_unique_this_year

  private
  def release_year_exists_if_released
    if self.released && !self.release_year
      self.errors.add(:release_year, message: "must exist if song is released")
    end
  end

  def release_year_is_in_the_past
    if self.release_year && self.release_year > Date.today.year
      self.errors.add(:release_year, "can't be in the future")
    end
  end

  def song_is_unique_this_year
    if Song.where(title: self.title, artist_name: self.artist_name, release_year: self.release_year).exists?
      self.errors.add(:title, "can't match another title by this artist this year")
    end
  end

end
