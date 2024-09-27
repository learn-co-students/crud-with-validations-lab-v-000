class Song < ActiveRecord::Base
  validates_presence_of :title, :artist_name
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name]
  }
  validates :released, inclusion: { in: [true, false] } # in: optional?
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  def released?
    released
  end
end
