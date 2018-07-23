class Song < ActiveRecord::Base
  validates :title, [presence: true]
  validates :released, inclusion: { in: [ true, false ] }
  validates :artist_name, [presence: true]
  validate :is_good_title?
  validate :is_year_present?
  validate :is_year_valid?

  def is_good_title?
    find songs were title = this title and released year = this released year
    if songs found
      errors.add(:title, "Title was already released in the same year")
    end
  end

  def is_year_present?
    if self.released
      if self.release_year not present
        errors.add
      end
    end
  end

  def is_year_valid?
    if year greater than current year
      errors.add
    end
  end
end
