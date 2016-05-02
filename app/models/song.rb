class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validate :not_repeated
  validate :released_has_valid_year

  def released_has_valid_year
    if released
      if release_year == nil
        errors.add(:release_year, "Please enter the release year.")
      elsif release_year > Time.now.year
        errors.add(:release_year, "Year is invalid for released song.")
      end
    end
  end

  def not_repeated
    errors.add(:title, "Song already exists.") if Song.find_by(title: title, artist_name: artist_name, release_year: release_year)
  end

end
