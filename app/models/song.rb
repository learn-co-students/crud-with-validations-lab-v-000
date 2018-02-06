class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :artist_name, presence: true
  

  #validates :release_year, only_integer: true

  with_options if: :is_released? do |song|
    song.validates :release_year, presence: true 
    song.validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.current.year }
    end
  #end

  def is_released?
    released == true
  end



  # if released:
  # validates :release_year, presence: true, if: :released?
  # validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.current.year }
  # else

end
