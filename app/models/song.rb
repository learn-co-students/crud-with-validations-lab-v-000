class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :release_year_conditions
  validate :cannot_release_same_song_in_same_year 
  validate :future_release_year_present_or_past

  def release_year_conditions
    if self.released == true && self.release_year == nil
      errors.add(:release_year, "must have value, if 'released' is true")
    end
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

  def future_release_year_present_or_past
    if self.release_year.to_i > Time.now.year 
      errors.add(:release_year, "must be current year or older, not in future")
    end
  end 
end 