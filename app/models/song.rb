class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validate :year_if_released
  validate :valid_year
  validate :no_repeats

  def no_repeats
    @matches = Song.all.detect do |s|
      s.artist_name == artist_name && s.release_year == release_year && s.title == title
    end
    unless @matches.nil?
      errors.add(:title, "Cannot have repeated titles by artist in same year")
    end
  end

  def year_if_released
    if released && release_year.nil?
      errors.add(:release_year, "Must have year if released")
    end
  end

  def valid_year
    if release_year && release_year > Time.now.year
      errors.add(:release_year, "Must be a valid year at or before this year")
    end
  end

end
