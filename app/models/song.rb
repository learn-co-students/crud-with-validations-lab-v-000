class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :cannot_release_same_song_in_same_year
  validate :released_is_a_boolean
  validates :release_year, presence: true, if: "self.released"
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, if: "self.released"

  def cannot_release_same_song_in_same_year
    song = Song.find_by(title: self.title)
    # the second check is for allowing updating of a song. Without this it won't pass
    #   validation when updating a song because it sees a conflict with itself.
    if song && self.id != song.id
      if song.released && self.released
        if song.release_year == self.release_year
          errors.add(:release_year, "can't be the same as another song with same title")
        end
      end
    end
  end

  def released_is_a_boolean
    rel = self.released
    rel.is_a?(TrueClass) || rel.is_a?(FalseClass)
  end

end
