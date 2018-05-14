class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :no_repeats_in_same_year, :release_year_restraints
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validates :genre, presence: true

  def no_repeats_in_same_year
    twice_in_year = Song.all.any? do |song| 
      if song.release_year == self.release_year 
        song.title == self.title 
      end
    end

    if twice_in_year
      errors.add(:title, "can't use title twice in one year")
    end
  end

  def release_year_restraints
    if released
      if self.release_year.blank?
        errors.add(:release_year, "if released, then release_year must be set")
      elsif self.release_year > Date.today.year
        errors.add(:release_year, "release_year must be <= current year")
      elsif !self.release_year.is_a?(Integer)
        errors.add(:release_year, "release_year must be an Integer")
      end
    end
  end
end
