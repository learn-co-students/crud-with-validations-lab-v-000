require 'date'
class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :release_year, presence: true,
  if: '!!released',
  numericality: { only_integer: true, less_than_or_equal_to: Date.today.year}
  validates :artist_name, presence: true

end
