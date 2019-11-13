class Song < ApplicationRecord
  # [x] Must not be blank
  # [ ] Cannot be repeated by the same artist in the same year
  validates :title, presence: true, uniqueness: { scope: :year, if: :same_artist_and_year?, message: "can only happen once per year" }
  # [x] Must be true or false
  validates :released, inclusion: { in: [true, false] }
  # [x] Optional if released is false
  # [x] Must not be blank if released is true
  # [x] Must be less than or equal to the current year
  validates :year, presence: true, if: :released?, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year }
    # [x] Must not be blank
  validates :artist_name, presence: true

  def same_artist_and_year?
    # does song title exist by same artist, if so check if year matches
    #binding.pry
    Song.find_by(title: self.title, artist_name: self.artist_name, year: self.year)
  end

  def released?
    released == true
  end
end
