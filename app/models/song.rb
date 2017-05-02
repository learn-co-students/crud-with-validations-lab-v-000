class Song < ActiveRecord::Base

  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.today.year}, if: :released?
end


def released?
  released
end
