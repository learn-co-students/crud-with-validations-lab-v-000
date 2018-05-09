validates :title, presence: true
# is invalid if an artist tries to release the same song twice in a year
validates :title, uniqueness: { scope: [:release_year, :artist_name],
  message: "cannot be repeated by the same artist in the same year" }
# released must be true or false
validates :released, inclusion: { in: [true, false] }
validates :artist_name, presence: true

with_options if: :released? do |song|
  # is invalid without release year when released is true
  song.validates :release_year, presence: true
  # is invalid when the release year is in the future
  song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
end

def released?
  released
end
