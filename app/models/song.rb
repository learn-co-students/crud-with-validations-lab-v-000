class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validate :require_release_year
  validate :no_future_release_year
  validate :no_rerelease

  def require_release_year
    if released && release_year == nil
      errors.add(:release_year, "must have a release year if released")
    end
  end

  def no_future_release_year
    if release_year.to_i > 2015
      errors.add(:release_year, "release year shouldn't be in the future")
    end
  end

  def no_rerelease
    if song = Song.find_by(artist_name: artist_name)
      if id == nil && song.release_year == release_year && song.title == title
        errors.add(:title, "can't re-release the same song in the same year")
      end
    end
  end

end
