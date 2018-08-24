class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true

  validate :song_not_repeated?
  validate :release_year_validation
  validate :release_year_year

  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "Cannot be repeated by the same artist in the same year"
  }

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end


  def song_not_repeated?
    @song = Song.find_by(title: self.title, released: self.released, release_year: self.release_year, artist_name: self.artist_name, genre: self.genre)
    if !@song
      true
    else
      if @song.release_year != nil
        if @song.release_year != self.release_year
          true
        else
          false
          # errors.add(:title, "Song already exists for that year")
        end
      else
        # errors.add(:release_year, "No release year")
        false
      end
    end
  end

  def release_year_validation
    if self.released == true
      if self.release_year != nil && self.release_year != ""
        true
      else
        false
      end
    else
      true
    end
  end

  def release_year_year
    if self.release_year != nil && self.release_year != ""
      if self.release_year <= Time.now.year
        true
      else
        false
      end
    else
      false
    end
  end

  def released?
    released
  end

end
