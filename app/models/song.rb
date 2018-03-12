class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :artist_name, presence: true
  
  with_options if: :is_released? do |song|
    song.validates :release_year, presence: true, numericality: {less_than_or_equal_to: DateTime.now.year}
  end

  def is_released?
    released
  end
end
