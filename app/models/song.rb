class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:release_year, :artist_name]
  validates :released, inclusion: {in: [true, false]}

end
