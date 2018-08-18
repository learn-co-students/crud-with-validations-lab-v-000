
class Song < ActiveRecord::Base
  validates :released, inclusion: { in: [true, false] }
  validates :title, presence: true
  validates :artist_name, presence: true
  
  
  
end
