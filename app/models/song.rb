class Song < ActiveRecord::Base
  validates :title, :artist_name, :genre, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, if: :released

  validate :title_cannot_be_repeated, on: :create


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

end
