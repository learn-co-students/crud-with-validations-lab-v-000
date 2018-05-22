class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: %w(True False) }
  validates :release_year, presence: true, if: :realeased?
  validates :artist_name, presence: true
end
