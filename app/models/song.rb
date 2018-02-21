class Song < ActiveRecord::Base
  time = Time.new
  validates :title, presence: true, uniqueness: true
  validates :release_year, presence: true,  numericality: { less_than_or_equal_to: time.year }, if: :released
end
