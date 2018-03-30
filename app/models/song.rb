class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, format: { with: /true|false/ }
  validates :release_year, presence: true, if: 'released == true'
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: 'release_year.present?'
  validates :artist_name, presence: true
end
