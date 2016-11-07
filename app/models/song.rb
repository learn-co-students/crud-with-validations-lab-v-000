class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validate :must_have_release_year_if_song_has_been_released, :release_year_cannot_be_in_the_future, :cannot_release_same_song_twice_in_one_year

  def release_year_cannot_be_in_the_future
    if release_year && release_year > Time.now.year
      errors.add(:release_year, "can't be in the future")
    end
  end

  def must_have_release_year_if_song_has_been_released
    if released == true && !release_year
      errors.add(:release_year, "released songs must have a release year")
    end
  end

  def cannot_release_same_song_twice_in_one_year
    if self.class.find_by(title: self.title, release_year: self.release_year)
      errors.add(:artist_name, "cannot release same song twice in one year")
    end
  end
end
