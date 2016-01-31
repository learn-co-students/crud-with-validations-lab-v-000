class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name]}
  validates :release_year, presence: true, 
    if: Proc.new {|a| a.released == true}
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year},
    unless: Proc.new {|a| a.release_year.nil?}
end
