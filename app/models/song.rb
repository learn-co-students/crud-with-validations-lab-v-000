class Song < ActiveRecord::Base
  validates :title, :artist_name, :genre, presence: true
  validates :released, inclusion: { in: [true, false] }
  validate :title_cannot_be_repeated, on: :create
  validates :release_year, presence: true, if: :released?
  validate :release_cannot_be_in_future

  def released?
    self.released == true
  end

  def title_cannot_be_repeated
    if Song.find_by(title: self.title)
      song = Song.find_by(title: self.title)
      if self.artist_name = song.artist_name
        if self.release_year = song.release_year
          errors.add(:title, "can't be repeated")
        end
      end
    end
  end

  def release_cannot_be_in_future
    if self.released
      if release_year
        if release_year > Date.today.year
          errors.add(:release_year, "can't be in the future")
        end
      end
    end
  end
end
