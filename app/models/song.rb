class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year, message: "should happen once per year" }
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, presence: true, if: :released?
  validates :artist_name, presence: true
  
  def released?
    released == true
  end

end
