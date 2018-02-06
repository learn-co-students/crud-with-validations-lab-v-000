class Song < ActiveRecord::Base
  validates_presence_of :title
  validates :title, uniqueness: { scope: [:release_year, :artist_name] }
  with_options if: :released do |song|
    song.validates_presence_of :release_year
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end

  def released?
    released == true
  end
end
