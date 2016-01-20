class Song < ActiveRecord::Base
  validates_presence_of :title, :artist_name
  validates :title, uniqueness: {
    scope: [:artist_name, :release_year],
    message: "can't be released by the same artist in the same year"
  }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true,
    numericality: { less_than_or_equal_to: Time.now.year },
    length: { is: 4 },
    if: Proc.new{ |song| song.released }
end
