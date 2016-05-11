class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :genre, presence: true
  validates :release_year, numericality: true
  validates :released, presence: true

end
