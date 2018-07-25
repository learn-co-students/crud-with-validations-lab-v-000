class Song < ActiveRecord::Base
  
  validates :title, presence: true
  # validates_uniqueness_of :title, scope: [:release_year, :artist_name]
  validates :released, inclusion: {in: [true, false]}
  # validates :release_year, presence: true, unless: Song.new { |a| a.released.blank? }, numericality: { less_than_or_equal_to: Date.today.year }
  validates :artist_name, presence: true
end
