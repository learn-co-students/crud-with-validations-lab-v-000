class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year, message: "this song was already released this year"}
  validates :artist_name, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?, allow_nil: false

end
