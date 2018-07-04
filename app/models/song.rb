class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
  scope: [:release_year, :artist_name],
    message: "cant have the same artist with the same year"
  }
  validates :released, inclusion: { in: [true, false] }
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end
  validates :artist_name, presence: true
end
