
class Song < ActiveRecord::Base
  
  validates :title, presence: true, uniqueness: {
    scope: [:release_year, :artist_name]
  }
  
  #validate :unique_title_per_artist_per_year
  # Cannot be repeated by the same artist in the same year
  
  validates :released, inclusion: { in: [true, false] }
  
  validates :release_year, numericality: { only_integer: true } # Optional if released is false, Must not be blank if released is true, Must be less than or equal to the current year
  
  validates :artist_name, presence: true
  
  private

end
