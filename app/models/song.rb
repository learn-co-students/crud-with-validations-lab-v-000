class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
  with_options if: :is_released? do |released|
               released.validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.current.year }
  end

  validates :artist_name, presence: true

  def is_released?
    self.released == true
  end
end
