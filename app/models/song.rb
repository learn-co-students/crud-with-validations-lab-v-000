class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name]}
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates_presence_of :release_year, if: :released
  validates :release_year, numericality: { less_than_or_equal_to: 2019}, if: :released

end
