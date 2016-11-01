class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validate :is_in_the_past?
  validate :has_release_date?
  validate :same_song_twice?


  def is_in_the_past?
    if !release_year.nil? && release_year > Time.now.year
      errors.add(:release_year, "Release year cannot be in the future")
    end
  end

  def has_release_date?
    if released == true && release_year.nil?
      errors.add(:release_year, "Must have release year")
    end
  end

  def same_song_twice?
    if Song.all.any? { |song| song.title == title && song.release_year == release_year}
      errors.add(:title, "Cannot release the same song twice in the same year")
    end
  end

end
