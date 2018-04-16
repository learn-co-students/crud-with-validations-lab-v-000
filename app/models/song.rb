class Song < ActiveRecord::Base
  validates :title, presence:true
  validates :title, uniqueness: {scope: [:artist_name, :release_year]}
  with_options if: :released? do |song|
    song.validates :release_year, presence:true
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}
  end

  def released?
    released
  end
end
