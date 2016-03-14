class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, :inclusion => {:in => [true, false]}
  validates :release_year, numericality: { only_integer: true }
  validates :artist_name, presence: true
  validates :genre, presence: true
end
