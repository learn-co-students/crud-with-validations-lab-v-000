class Song < ActiveRecord::Base
  validates :title, presence: true
  # validates :title (cannot be repeated by same arist in the same year)
  validates :released, inclusion: [true, false]
  # validates :release_year, (optional if released == false, presence:true if released == true must be <= current year)
  validates :artist_name, presence: true
end
