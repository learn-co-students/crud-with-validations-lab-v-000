class Song < ActiveRecord::Base
  validates_presence_of :title, :artist_name

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
  end

  validates_uniqueness_of :title, scope: [:artist_name, :release_year]



  def released?
    released
  end
end
