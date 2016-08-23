class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :cannot_release_same_song_in_same_year
  validate :released_is_a_boolean
  validates :release_year, presence: true, if: "self.released"

  def cannot_release_same_song_in_same_year
    song = Song.find_by(title: self.title)
    if song
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
