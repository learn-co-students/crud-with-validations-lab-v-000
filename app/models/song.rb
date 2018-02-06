class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :unique_title_per_artist_per_year
  validate :release_date

  def unique_title_per_artist_per_year
    if s = Song.find_by(title: title)
      if s.artist_name == artist_name && s.release_year == release_year
        errors.add(:title, "an artist can't release two songs with the same name in the same year")
      end
    end
  end

  def release_date
    if !!released
      if !release_year
        errors.add(:release_year, "released songs must have a release year")
      elsif release_year > Date.today.year
        errors.add(:release_year, "release year must be the current year or earlier")
      end
    end
  end
end
