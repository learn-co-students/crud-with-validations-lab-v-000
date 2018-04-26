class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false], allow_blank: true }
  validates :artist_name, presence: true
  validates :release_year, numericality: { :less_than_or_equal_to => 2018, if: :was_released }
  validate :cannot_release_same_song_in_same_year
  def was_released
    released == true
  end

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

end
