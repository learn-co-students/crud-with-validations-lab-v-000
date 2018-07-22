class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  # placeholder for :release_year
  validates :artist_name, presence: true
end
