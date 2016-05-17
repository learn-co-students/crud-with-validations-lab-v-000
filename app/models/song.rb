class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, if: :released, :inclusion => { :in => 1900..Time.now.year } 

  validates :artist_name, presence: true
end