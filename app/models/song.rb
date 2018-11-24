

class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :release_year}
  validates :released, presence: true, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?, numericality: {less_than_or_equal_to: Time.new.year}
  validates :artist_name, presence: true
  validates :genre, presence: true









end
