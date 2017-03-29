class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "An artist can't release same song in the same year"}
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {less_than_or_equal_to: 2017}
  end
  validates :released, inclusion: {in: [true, false], message: "released must be true or false"}
  validates :artist_name, presence: true

end
