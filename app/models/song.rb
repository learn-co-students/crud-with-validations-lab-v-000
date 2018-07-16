class Song < ActiveRecord::Base
  validates :title, :artist_name, :genre, presence: true
  validates :title, uniqueness: true
end
