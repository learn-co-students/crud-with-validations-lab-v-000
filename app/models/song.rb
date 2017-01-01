class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:artist_name, :release_year], 
    message: "song cannot be repeated by the same artist in the same year"
  }
  validates :released, inclusion: { in: [true, false] }

  with_options if: :song_released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end

  validates :artist_name, presence: true

  def song_released?
    released
  end
end
