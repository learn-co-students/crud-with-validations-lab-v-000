
class Song < ActiveRecord::Base
  
  validates :title, presence: true # Cannot be repeated by the same artist in the same year
  
  validates :released, inclusion: { in: [true, false] }
  
  validates :release_year, numericality: { only_integer: true } # Optional if released is false, Must not be blank if released is true, Must be less than or equal to the current year
  
  validates :artist_name, presence: true
  
end
