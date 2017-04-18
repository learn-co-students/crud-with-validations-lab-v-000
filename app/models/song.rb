class Song < ActiveRecord::Base
  validates :artist_name, presence: :true
  validates :title, presence: :true
  validate :duplicate_in_artist?
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, presence: :true,
                           if: :released
  validate :released_before_this_year?,
           if: :released



  def duplicate_in_artist?
    potential = Song.find_by(title: self.title)
    if potential != nil
      if potential != self && potential.artist_name == self.artist_name
        errors.add(:name, "a song with this name and artist has already been created")
      end
    end
  end

  def released_before_this_year?
    if self.release_year == nil || self.release_year > Time.new.year
      errors.add(:release_year, "must be in the past")
    end
  end

end
