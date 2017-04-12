class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }
  validates :released, inclusion: {in: [true, false]}
  #release year is optional if released is false
  #must not be blank if released is true
  #must be less than or equal to current year
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end

  validates :artist_name, presence: true
  # not sure if this is needed:
  # validates :genre, presence: true

  def released?
    released
  end
end
