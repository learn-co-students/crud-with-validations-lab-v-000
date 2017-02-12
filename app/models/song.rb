class Song < ActiveRecord::Base

  validates :title, presence: true

  validates :title, uniqueness: { scope: [:release_year,
    :artist_name], message: "cannot be repeated in same year"}

  validates :released, inclusion: { in: [true, false] }


  validates :artist_name, presence: true

  with_options if: :released? do |song|
      song.validates :release_year, presence: true
      song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}
  end

  validates :genre, presence: true

  def released?
    released
  end


end


# title, a string  ----
# Must not be blank   ----
# Cannot be repeated by the same artist in the same year -----
# released, a boolean describing whether the song was ever officially released. ---
# Must be true or false ---
# release_year, an integer ---
# Optional if released is false
# Must not be blank if released is true
# Must be less than or equal to the current year
# artist_name, a string
# Must not be blank
# genre, a string
