class Song < ActiveRecord::Base

  validates :title, :artist_name, presence: true
  validates_uniqueness_of :title, scope: :release_year
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :is_released?
  validates :release_year, numericality: {less_than_or_equal_to: Date.current.year}, if: :is_released?

  def is_released?
    self.released == true
  end
end
