class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "Can not be same title within same year and by same artist" }
  validates :released, inclusion: { in: [true, false] }

  with_options if: :release? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end

  def release?
    released
  end
end
