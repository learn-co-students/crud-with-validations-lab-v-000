class Song < ActiveRecord::Base
  validates :title, presence: :true
  validates :released, inclusion: { in: %w(true false)}
  validates :release_year, numericality: { greater_than: 2018}
  validates :artist_name, presence: :true
end
