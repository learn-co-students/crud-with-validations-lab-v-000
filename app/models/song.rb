class Song < ActiveRecord::Base
  validates :artist_name, :genre, presence: true

  validates :title, uniqueness: true

  validates :released, inclusion: { in: [true, false] }

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {less_than: Time.current.year}
  end

  def released?
    released
  end
end
