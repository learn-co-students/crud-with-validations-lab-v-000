class Song < ActiveRecord::Base
  validates :artist_name, presence: true
  validates :genre, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :title, presence: true, 
    uniqueness: { scope: [:release_year, :artist_name],
    message: "title cannot be repeated by the same artist in the same year"
  }
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.now.year }, if: :released?
end