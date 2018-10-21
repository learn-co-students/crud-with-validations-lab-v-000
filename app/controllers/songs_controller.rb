class SongsController < ActionController::Base
  validates :title, presence: true, uniqueness: true
  validates :released, 
  validates :artist_nam, presence: true
end
