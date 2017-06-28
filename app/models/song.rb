class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, presence: true, if: :is_this_song_valid?
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  def released?
    released
  end

  def is_this_song_valid?
    song = Song.find_by(title: self.title)
    if song
      if song.release_year == self.release_year
        errors.add(:title, "This title has been taken already. Choose different title.")
      else
        true
      end
    end
    true
  end

end
