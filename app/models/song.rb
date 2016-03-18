class Song < ActiveRecord::Base
   validates :title, presence: true
   validates :title, uniqueness: { scope: :release_year }, if: :artist_has_same_title
  validates :released, inclusion: { in: [true, false]}
  validates :artist_name, presence: true
  validate :released_in_the_past?, if: :released?

  def artist_has_same_title
    Song.all.any? do |song|
      self.artist_name == song.artist_name && self.title == song.title
    end
  end

  def released_in_the_past?
    if !(self.released && self.release_year && self.release_year <= Time.new.year)
      errors.add(:release_year, "can't be released in the future")
    end
  end

  def released?
    self.released
  end

end
