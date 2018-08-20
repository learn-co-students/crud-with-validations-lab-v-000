
class Song < ActiveRecord::Base
  
  validates :title, presence: true, uniqueness: {
    scope: [:artist_name, :release_year]
  }
  
  validates :released, inclusion: { in: [true, false] }
  
  validates :release_year, presence: true, if: -> { :released && :release_year <= DateTime.now.year }  
  
  validates :artist_name, presence: true
  
end
