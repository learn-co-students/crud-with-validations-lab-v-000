class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: { scope: :artist_name && :release_year,
    message: "Title can't be repeated by the same artist in the same year"}

  validates :released, inclusion: { in: [true, false] }

  with_options :if => :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end

  def released?
    released
  end

  validates :artist_name, presence: true

  validates :genre, presence: true
end
