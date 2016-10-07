class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :artist_name, presence: true
   validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "cannot be repeated by the same artist in the same year"
  }
  
  #this says you can need to write true or false i think 
  validates :released, inclusion: { in: [true, false] }


  # this logic says that if :released is a true value, then we need
  # the release year to be present, and it must be less than or equal to
  # current year
  # dont need to put in false logic - dont need to validate release year
  # if released is false 
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  def released?
    released
  end
   
end

