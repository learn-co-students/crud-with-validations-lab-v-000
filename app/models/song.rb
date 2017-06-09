class Song < ActiveRecord::Base
  validates_presence_of :title
  validates :title, uniqueness: true
  
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
