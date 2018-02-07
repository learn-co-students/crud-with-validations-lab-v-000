class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false]}
  validates :artist_name, presence: true
  validates_numericality_of :release_year, less_than: Time.now.year, if: "released"
  validates :title, uniqueness: true

end
