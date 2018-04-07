class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: {in: [true, false]}
  validate :released_twice?


  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {less_than_or_equal_to: Date.current.year}
  end

  def released?
    released
  end

  def released_twice?
    if Song.all.find_by(title: title, release_year: release_year)
      errors.add(:title, "can't be released twice in the same year")
    end
  end
end
