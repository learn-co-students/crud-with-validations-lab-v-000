class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :release_year_presence
  validate :release_year_past
  validate :song_unique_year

  def release_year_presence
    if released
      errors.add(:release_year, "must be present if song has been released.") unless release_year
    end
  end

  def release_year_past
    if release_year
      errors.add(:release_year, "must be in the past.") unless release_year <= 2018
    end
  end

  def song_unique_year
    if title && release_year && artist_name && !id
      Song.all.each do |song|
        if song.release_year == release_year && song.title == title && song.artist_name == song.artist_name
          errors.add(:title, "cannot be released multiple times in the same year.")
        end
      end
    end
  end
end
