class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year,
  message: "can't be used twice in one year" }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, if: :released?, presence: true, numericality: {less_than_or_equal_to: Time.now.year}
  validates :artist_name, presence: true
  validates :genre, presence: true
end
