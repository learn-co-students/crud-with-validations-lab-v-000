class Song < ActiveRecord::Base
  validates :title, presence: true
  #validates :title, uniqueness: true
  #better
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "cannot be repeated by the same artist in the same year"
  }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true

  with_options if: :released? do |song| #if released returns true
    song.validates :release_year, presence: true #make sure a release year is givem
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year} #and the date is not in the future
  end

  def released? #returns value of released attr --> true if true, false if false
    released
  end
end
