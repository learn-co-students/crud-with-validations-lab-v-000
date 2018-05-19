class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name] }
  validates :artist_name, presence: true
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, :if => :released?
end
