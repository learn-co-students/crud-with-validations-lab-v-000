class Song < ActiveRecord::Base
  validates :title, presence: true 
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "can't be re-released this year"
  }
  validates :released, inclusion: { in: [true, false]}
  validates :artist_name, presence: true

  with_options if: :is_released do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year }
  end

  def is_released 
    released
  end 

end
