class Song < ActiveRecord::Base
  validates :title, presence: true, unless: :released_same_year?
  validates :released, inclusion: { in: [true, false] }
  validate :valid_released_year

  def valid_released_year
    if self.released && !self.release_year
      errors.add(:released_year, 'Must have a valid release year if released')
    elsif self.released && self.release_year >= Time.now.year
      errors.add(:release_year, 'Song cannot be released in the future!')
    end
  end

  def released_same_year?
    song = Song.find_by(title: self.title)
    if song && song.release_year == self.release_year
      errors.add(:release_year, 'Cannot be released again this year')
    end
  end
end
