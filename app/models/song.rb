class Song < ApplicationRecord
  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false ] }
  validate :must_not_be_repeated_by_same_artist_in_same_year
  validate :release_year_must_match_released
  validate :release_year_must_not_be_in_the_future

  def must_not_be_repeated_by_same_artist_in_same_year
    if Song.all.any? {|s| s.title == self.title && s.release_year == self.release_year}
      errors.add(:title, "Cannot be repeated by the same artist in the same year")
    end
  end

  def release_year_must_match_released
    if released == false && !!release_year == true
      errors.add(:release_year, "Can't have release year when released is false")
    elsif released == true && !!release_year == false
      errors.add(:release_year, "Must have release year when released is true")
    end
  end

  def release_year_must_not_be_in_the_future
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "Release year cannot be in the future")
    end
  end
end
