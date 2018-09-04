class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :artist_name, presence: true
  validates :genre, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :song_released?
  validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.today.year }, if: :song_released?


  def song_released?
    released
  end
end
