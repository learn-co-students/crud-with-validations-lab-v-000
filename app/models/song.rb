class Song < ActiveRecord::Base
  validates :title, presence: true
<<<<<<< HEAD
  validates :title, uniqueness: { scope: [:release_year, :artist_name]}
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates_presence_of :release_year, if: :released
  validates :release_year, numericality: { less_than_or_equal_to: 2019}, if: :released

end
=======
  validates :title, uniqueness: { scope: :year }
  validates :artist_name, presence: true
end 
>>>>>>> 333f89375305086a140d6e5edb3424c106af40dc
