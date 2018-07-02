class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:artist_name, :release_year]} #need column index?
  validates :released, inclusion: {in: %w(true, false)}
  validates :release_year,presence: true, numericality: {less_than_or_equal_to: Date.today.year}, if: :released#maybe need to be something else
  validates :artist_name, presence: true
end
