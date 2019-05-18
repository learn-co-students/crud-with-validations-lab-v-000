class Song < ApplicationRecord
  validates :title, presence: true
  validate :release_year_check
  validate :same_song_same_year


  def release_year_check
    if self.release_year == nil && self.released == true
      errors.add(:release_year, "cant be released without a release year")
      errors.add(:released, "cant be released without a release year")
    end

    if self.release_year != nil
      if self.release_year > 2019
        errors.add(:release_year, "cant be released in the future")
      end
    end
  end

  def same_song_same_year
    if Song.find_by(:artist_name => self.artist_name, :release_year => self.release_year, :title => self.title) != nil
      errors.add(:release_year, "Artist cant relase two songs with same name in same year")
    end
  end

end
