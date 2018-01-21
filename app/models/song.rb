class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year, message: "should happen once per year" }
  validates :artist_name, presence: true
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, presence: { released: true },
    unless: Proc.new { |s| s.released == false }
end
