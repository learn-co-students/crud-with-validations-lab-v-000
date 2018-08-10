class Song < ActiveRecord::Base

  validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year], message: "The title cannot be repeated by the same artist in the same year." }
  validates :released, inclusion: { in: [true, false] }

  with_options if: :is_the_song_released? do
    validates :release_year, presence: true
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end

  validates :artist_name, presence: true

  def is_the_song_released?
    released
  end

end
