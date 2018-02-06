class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year], message: "Title cannot be repeated by the same artist in the same year" }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.now.year }, if: :released?
  validates :artist_name, presence: true
end
