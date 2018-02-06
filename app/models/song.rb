class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :release_year, message: "cannot be repeated by artist in the same year"}
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released, numericality: {less_than_or_equal_to: Date.today.year}
  validates :artist_name, presence: true

end
