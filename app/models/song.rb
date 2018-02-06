class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { :scope=>[:artist_name, :release_year],
                                  message: "Artist can't have the same song in the same year."} 
  validates :artist_name, presence: true
  
  # validates :released, presence: true
  validates :released, inclusion: {in: [true, false]}

  with_options if: :released? do |rel|
# binding.pry
    rel.validates :release_year, presence: true
    rel.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
  end
  

  def released?
# binding.pry
    released
  end

end
