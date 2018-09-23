class Song < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :title, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?
  validates :artist_name, presence: true
  
  with_options if: :released? do |song|
    song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
  end
  
  
  def released?
    released == true
  end
  
end
