class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { :scope => [:release_year, :artist_name]}
  validates :released, inclusion: { in: [ true, false ] }
  validates :artist_name, presence: true
  #validates :release_year, presence: true, if: need to finish this
end
