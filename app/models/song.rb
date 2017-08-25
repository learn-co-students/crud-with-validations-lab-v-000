class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false]}
  validates :artist_name, presence: true
  validate :release_year_present_or_less
  validate :song_uniqueness



  def release_year_present_or_less
    if released == true
      if release_year && release_year > Date.today.year
        errors.add(:release_year, "the release year can't be in the future")
      elsif !release_year
        errors.add(:release_year, "you must enter a release year")
      end
    end
  end

  def song_uniqueness
    # Cannot be repeated by the same artist in the same year
    # if the song has been released in the current year
    # find an instance in the database where it has the same title, artist_name
    # check if the song about to be saved is released, check if the song(the one found) exists,
    # check if the release_year is same.
    # if song = nil, error message will not run.
    song = Song.find_by(title: title, artist_name: artist_name)
    if released && song && self.release_year == song.release_year
      errors.add(:title, "cannot be repeated by the same artist in the same year")
    end
  end

end
