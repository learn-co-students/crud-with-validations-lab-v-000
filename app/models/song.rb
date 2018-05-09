class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false ] }
  validate :unique_title_for_artist_in_year?
  validate :valid_release_year



  private

  def unique_title_for_artist_in_year?
    # is invalid if an artist tries to release the same song twice in a year
    Song.all.any? do |song|
      if song.title == title && song.artist_name == artist_name && song.release_year == release_year
        errors[:base] << "title must be unique for the artist within the year"
      end
    end
  end

  def valid_release_year
    # is invalid without release year when released is true
    if
    released && release_year.nil?
      errors.add(:release_year, "must be included if song has been released")
    # is valid without release year when released is false
    elsif
    !released && release_year.nil?
      true
    # is invalid when the release year is in the future
    elsif
    release_year > DateTime.now.year
      errors.add(:release_year, "cannot be in the future")
    end
  end
end
