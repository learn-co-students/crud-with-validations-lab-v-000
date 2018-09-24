class Song < ActiveRecord::Base
  validates :title, uniqueness: { scope: [:release_year, :artist_name]}
  validates_with ReleaseYearValidator
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
end
