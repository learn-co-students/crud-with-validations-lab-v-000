class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :artist_name, presence: true
  validate :release_year_current
  validate :release_year_and_release
  validate :same_title

  def release_year_current
    if !(release_year.to_i <= Time.current.year)
      errors.add(:release_year, "release year must be before or on this year")
    end
  end

  def release_year_and_release
    if release_year.nil? && released == true
      errors.add(:release_year, "release year is required")
    end
  end

  def same_title
    if self.class.all.find_by(artist_name: self.artist_name) && self.class.all.find_by(release_year: self.release_year) && self.class.all.find_by(title: self.title)
      errors.add(:title, "cannot release the same title by the same artist and year")
    end
  end
end
