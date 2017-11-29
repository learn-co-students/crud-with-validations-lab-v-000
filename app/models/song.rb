class Song < ActiveRecord::Base
  validates :title, presence: true, allow_blank: false
  validates :title, uniqueness: { 
      scope: [:release_year, :artist_name], 
      message: "Cannot be repeated by the same artist in the same year"
    }
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true, allow_blank: false
  

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}
    end
  
  


  def released?
    released
  end  

  # def current_year

end