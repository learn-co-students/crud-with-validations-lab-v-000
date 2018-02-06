class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, numericality: true, presence: true, if: :is_released?, unless: :check_year

  def is_released?
    self.released == true
  end

  def check_year
    if self.release_year != nil
      if  self.release_year > Date.today.year
        self.errors.add(:release_year, "the release year is in the future")
        true
      else
        false
      end
    end
  end
end
