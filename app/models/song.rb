class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, presence: true
  validates :artist_name, presence: true

end
