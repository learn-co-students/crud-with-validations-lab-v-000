class Song < ActiveRecord::Base
  validates_presence_of :title, :artist_name
  validates_uniqueness_of :title, scope: [:release_year, :artist_name]
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, if: :released?, 
    numericality: { only_integer: true, less_than_or_equal_to: Date.today.year }
end