class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }

  validates :released, inclusion: { in: [true, false] }

  with_options if: :released? do |released_song|
    released_song.validates :release_year, presence: true
    released_song.validates :release_year, numericality: { only_integer: true,
      greater_than_or_equal_to: 0, less_than_or_equal_to: Date.today.year }
  end

  validates :artist_name, presence: true

  private

  def released?
    released
  end
end
