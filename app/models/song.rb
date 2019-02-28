class Song < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates_uniqueness_of :title, scope: [:release_year, :artist_name],  message: 'has already been released by the same artist in the same year'
  validates :artist_name, presence: true
  validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, presence: true, if: :released
  validates :released, inclusion: { in: [true, false] }

end
