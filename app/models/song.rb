class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?
  validate :release_date_in_the_past?
  validate :same_artist_same_year?

  def release_date_in_the_past?
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "must be less than or equal to this year")
    end
  end

  def released?
    released == true
  end

  def same_artist_same_year?
    if release_year.present? && Song.find_by(title: title, artist_name: artist_name, release_year: release_year)
      errors.add(:title, "cannot be the same title if the artist and release year are the same")
    end
  end
end
