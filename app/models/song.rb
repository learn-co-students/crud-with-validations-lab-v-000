class Song < ActiveRecord::Base

  validates :title, :artist_name, :genre, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :title, uniqueness: { scope: [:artist_name], message: "Artist name is already taken"}

  with_options if: :released_is_true? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
          less_than_or_equal_to: Date.today.year
    }
  end


  def released_is_true?
      released
  end


end
