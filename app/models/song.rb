class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: %i[release_year artist_name],
    message: 'cannot be repeated by the same Artist in the same Year'
  }
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?
end
