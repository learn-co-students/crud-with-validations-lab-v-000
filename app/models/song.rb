class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:artist_name, :release_year],
    message: 'Artists cannot release the same song twice in one year'
  }
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, if: :released?
  end
end
