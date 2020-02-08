class Song < ApplicationRecord
  validates :title, :artist_name, :release_year, presence: true
end
