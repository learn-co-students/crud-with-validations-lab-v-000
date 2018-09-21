class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year}
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :release_year, length: {is: 4}, if: :is_released?
  validate :future_year?

  def is_released?
    self.released == true
  end

  def future_year?
  #  binding.pry
    if self.release_year != nil && self.release_year > Date.today.year
      errors.add(:release_year, "Release year can't be in the future")
    end
  end

end
