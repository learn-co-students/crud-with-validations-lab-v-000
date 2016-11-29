class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :artist_name, presence: true
  validate do
    title_not_repeated_by_artist_in_same_year
    release_year_not_blank_and_less_than_or_equal_to_current_year_if_released
  end

  def title_not_repeated_by_artist_in_same_year
    if !Song.find_by(title: self.title, release_year: self.release_year, artist_name: self.artist_name).nil?
      errors.add(:base, "title cannot be repeated by the same artist in the same year.")
    end
  end

  def release_year_not_blank_and_less_than_or_equal_to_current_year_if_released
    if self.released
      if self.release_year.nil?
        errors.add(:base, "Must have a release year if released.")
      elsif self.release_year > Time.now.year
        errors.add(:base, "Release year must be less than or equal to current year.")
      end
    end
  end

end
