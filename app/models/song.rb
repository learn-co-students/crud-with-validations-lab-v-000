class Song < ActiveRecord::Base
  validates :title, presence: :true
  validates :released, inclusion: {in: [true, false]}
  validate :release_year_valid?
  validates :artist_name, presence: :true
  validate :unique_song_for_artist

  def release_year_valid?
    if released
      if !release_year || release_year == ""
        errors.add(:release_year, "release year cannot be blank if song was released")
      elsif release_year > Date.today.year
        errors.add(:release_year, "release year cannot be greater than current year")
      end
    end
  end

  def unique_song_for_artist
    other_song = Song.find_by(title: title)
    if other_song && other_song.artist_name == artist_name && other_song.release_year == release_year
      errors.add(:artist_name, "this artist already has song listed")
    end
  end
end
