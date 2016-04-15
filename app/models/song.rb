class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validate :validate_title
  validate :validate_release_year
end

def validate_title
  get = Song.where("title =? and artist_name = ? and release_year = ?", title, artist_name, release_year)
  if get.count >= 1
    errors.add(:title, "cannot add duplicate song for artist in same year")
  end
end

def validate_release_year
  if release_year && release_year > Time.current.year.to_i
    errors.add(:title, "cannot add duplicate song for artist in same year")
  end
  if released && !release_year 
    errors.add(:title, "must have a release year for a released album")
  end
end