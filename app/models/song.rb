class Song < ActiveRecord::Base
  validates :title,  presence: true, uniqueness: { scope: :release_year, message: "must be uniuqe in a given year." }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released 
  validates :release_year, numericality: { less_than: DateTime.now.year }, if: :released
  validates :artist_name, presence: true
end
