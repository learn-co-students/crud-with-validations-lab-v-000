class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: {scope: :release_year, scope: :artist_name}
  validates :release_year, presence: true
  validates :released, inclusion: { in: %w(true false)}
end
