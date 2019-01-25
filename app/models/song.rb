class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :artist_name, presence: true

end
