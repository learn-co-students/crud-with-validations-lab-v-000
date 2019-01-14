class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :title_unique?, on: :create
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?
  validate :less_or_equal_to_current_year
  validates :artist_name, presence: true

  def released?
    released == true
  end

  def less_or_equal_to_current_year
    if !!release_year && release_year > Date.today.year
      errors.add(:release_year, "Cannot add songs with a year greater than current year.")
    end
  end

  def title_unique?
    s = Song.find_by(title: title)
    if !!s && s.artist_name == self.artist_name && s.release_year == self.release_year
      errors.add(:title_unique?, "Artist cannot have same title in the same year.")
    end
  end

end
