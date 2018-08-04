class Song < ActiveRecord::Base

# title, a string
# Must not be blank
  validates :title, presence: true
  # Cannot be repeated by the same artist in the same year
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "cannot be repeated by the same artist artist in the same year"
  }
  # released, a boolean describing whether the song was ever officially released.
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true

  # Optional if released is false
  # Must not be blank if released is true
  # Must be less than or equal to the current year
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality:{
      less_than_or_equal_to: Date.today.year
    }
  end

  def released?
    released
  end

end
