class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validates :released, exclusion: { in: [nil]}
  validates :release_year, numericality: {
    only_integer: true,
    less_than_or_equal_to: Date.current.year
  }, if: :released
end
