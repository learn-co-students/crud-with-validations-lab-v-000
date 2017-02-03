class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true 
  validates :title, uniqueness: true#{ scope: :year, message: "should happen once per year"}
  validates :released, inclusion: { in: [true, false]}
  with_options if: :released do |song|
    song.validates :release_year, presence: true 
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}
  end

end
