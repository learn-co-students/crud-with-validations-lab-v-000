class Song < ApplicationRecord
  validates :title, presence: true
#  validates :title, uniqueness: true { scope: :release_year, :artist_name }

end
