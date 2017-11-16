class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:artist_name, :release_year],
    message: "cannot be repeated by the same artist in the same year"
  }
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  def released? # the truthiness of calling #released, which returns true/false
    released # call #released on song instance (implicit self) to return released attribute (true or false value)
  end
end
