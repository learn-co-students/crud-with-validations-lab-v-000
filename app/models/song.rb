class Song < ActiveRecord::Base
  validates_presence_of :title, :artist_name
  validates_uniqueness_of :title, scope: [:artist_name, :release_year]
  validates :released, :inclusion => [true, false]
  validates :release_year, if: :released?,
    numericality: { only_integer: true, less_than_or_equal_to: Time.now.year }
end
