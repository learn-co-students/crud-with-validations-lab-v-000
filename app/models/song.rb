class Song < ActiveRecord::Base
  validates :title, :artist_name, :genre, presence: true

  validates :title, uniqueness: {scope: [:release_year, :artist_name]}

  validates :released, inclusion: { in: [true, false] }

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {less_than: Time.current.year}
  end

  def released?
    released
  end
end
