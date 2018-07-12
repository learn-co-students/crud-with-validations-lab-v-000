class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validate :release_year_required_if_released, :release_year_not_in_future, :unique_song_per_year

  def release_year_required_if_released
    if !release_year && released
      errors.add(:release_year, "must be included if song is released")
    end
  end

  def release_year_not_in_future
    if release_year && release_year > Date.today.year
      errors.add(:release_year, "must no be in the future")
    end
  end

  def unique_song_per_year
    if Song.all.any? {|s| s.title == title && s.release_year == release_year}
      errors.add(:title, "cannot release same song in same year")
    end
  end

end
