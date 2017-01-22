class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :released, inclusion: { in: [true, false], message: "Must be true or false" }

  validate :release_year_presence_if_released, :release_year_is_less_than_or_equal_to_current_year,
  :song_cannot_be_released_twice_on_same_year

  def release_year_presence_if_released
    if released == true && release_year.nil?
      errors.add(:release_year, "required if song is released")
    end
  end

  def release_year_is_less_than_or_equal_to_current_year
    if release_year && release_year.to_i > Time.new.year
      errors.add(:release_year, "must be current or previous year")
    end
  end

  def song_cannot_be_released_twice_on_same_year
    song = Song.find_by(title: title)
    if song && song.artist_name == artist_name && song.release_year == release_year
      errors.add(:release_year, "this song has already been released on this year")
    end
  end
end
