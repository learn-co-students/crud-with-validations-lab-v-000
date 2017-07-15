class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: :release_year, message: "can not use duplicate song name in same year" }
  validates :released, inclusion: { in: [true, false], message: "must be true or false" }
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released
end
