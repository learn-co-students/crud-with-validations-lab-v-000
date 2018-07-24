class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :artist_name, presence: true
  validate :is_good_title?
  validate :is_year_present?
  validate :is_year_valid?

  def is_good_title?
    if Song.where(:title => self.title, :release_year => self.release_year).count > 0
      errors.add(:title, "Title was already released in the same year")
    end
  end

  def is_year_present?
    if self.released
      if !self.release_year
        errors.add(:release_year, "Released Year Required")
      end
    end
  end

  def is_year_valid?
    # note: 1800 arbitrary choice for minimum year.  Better check would probably be something later
    if self.release_year
        if self.release_year > Date.today.year || self.release_year < 1800
          errors.add(:release_year, "Invalid Year")
        end
    end
  end
end
