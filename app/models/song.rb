class Song < ActiveRecord::Base
  validates :title, presence: true]7
  validates :released, inclusion: { in: [ true, false ] }
  validates :artist_name, presence: true
  validates :release_year, :length => {is: 4 }
  validate :is_good_title?
  validate :is_year_present?
  validate :is_year_valid?

  def is_good_title?
    if songs.find( :title => self.title, :released_year => this.released_year)
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
    if self.year > Date.today.year || self.year < "1800"
      errors.add(:release_year, "Invalid Year")
    end
  end
end
