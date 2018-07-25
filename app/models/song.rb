class Song < ActiveRecord::Base
  
  validates :title, presence: true, uniqueness: { scope: :release_year, :name }
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, unless: Song.new { |a| a.released.blank? }, numericality: { less_than_or_equal_to: Date.today.year }
  
end
