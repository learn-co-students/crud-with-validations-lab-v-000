class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: :release_year, message: "not the same title twice" }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: { less_than_or_equal_to: 2016 }, if: :released
end
