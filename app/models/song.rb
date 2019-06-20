class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year,
    message: "An artist can only release the same song once per year"}
  with_options if: :released? do |song|
    song.validates :released, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
  end
  validates :artist_name, presence: true

end
