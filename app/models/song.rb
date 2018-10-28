class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, numericality: {
    only_integer: true,
    less_than_or_equal_to: Date.current.year
  }, if: :song_released?
  validates :artist_name, presence: true
  validates :title, uniqueness: { scope: :release_year }


  def song_released?
    released == true
  end
end
