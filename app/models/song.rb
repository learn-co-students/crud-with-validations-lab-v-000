class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :artist_name, scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
  with_options if: :released_true? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.current.year }
  end
  validates :artist_name, presence: true

  def released_true?
    released == true
  end

end
