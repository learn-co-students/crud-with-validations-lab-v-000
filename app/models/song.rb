class Song < ActiveRecord::Base

  validates :title, presence: true
  # validates :released, typ
  
  validates :artist_name, presence: true
end
