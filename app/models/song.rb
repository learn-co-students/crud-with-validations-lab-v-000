class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, presence: true
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released
end
