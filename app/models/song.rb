class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: true, if: :same_title_same_year?
  validates :release_year, presence: true, if: :released?
  validates :artist_name, presence: true
  validate :in_the_past?

  def same_title_same_year?
    if Song.all.any?{|song| song.title == self.title}
      errors.add(:title, "cannot be repeated by the same artist in the same year")
    end
  end

  def in_the_past?
    if self.release_year && self.release_year > Time.current.year
      errors.add(:release_year, "release year is in the future, despite already being released.")
    end
  end

end
