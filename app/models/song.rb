class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
end
# title, a string
# Must not be blank
# Cannot be repeated by the same artist in the same year
# released, a boolean describing whether the song was ever officially released.
# Must be true or false
# release_year, an integer
# Optional if released is false
# Must not be blank if released is true
# Must be less than or equal to the current year
# artist_name, a string
# Must not be blank
# genre, a string
