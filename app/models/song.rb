class Song < ActiveRecord::Base
  validates :title, uniqueness: { scope: :release_year}
  validates_presence_of :title
  validates_presence_of :release_year, if: :released?
  validates_numericality_of :release_year, less_than_or_equal_to: Date.today.year, if: :released?
end
