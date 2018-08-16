class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.current.year }
  end
end
