class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, numericality: true
  validates :artist_name, presence: true
  validate :release_year_less_than_or_equal_to_current_year
  validate :title_cannot_be_repeated_by_same_artist_in_same_year

  def release_year_less_than_or_equal_to_current_year
    if released == true && release_year == nil
      errors.add(:release_year, "must not be blank if released is true")
    elsif released == true && release_year >= Time.now.year
      errors.add(:release_year, "must be less than or equal to current year")
    elsif released == false
      errors.delete(:release_year)
    end
  end

  def title_cannot_be_repeated_by_same_artist_in_same_year
    Song.all.each do |s|
      if s.title == title && s.artist_name == artist_name && s.release_year == release_year
        errors.add(:title, "title cannot be repeated by the same artist in the same year")
      end
    end
  end
end
