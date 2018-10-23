class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year] }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released
  validates :release_year, inclusion: { in: 0..2018 }, if: :released
  validates :artist_name, presence: true
end
