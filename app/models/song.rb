class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
  end
  validates :title, uniqueness: true

  def released?
    released
  end
end
