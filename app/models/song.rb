class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :title, uniqueness: {scope: :release_year, message: "Already exists for this year"}
  validates :release_year, presence: true, if: :released
  validates_numericality_of :release_year, :less_than_or_equal_to => Date.today.year, :allow_nil => true 
  validates :artist_name, presence: true

end
