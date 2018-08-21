class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in: %w{true false}}
  validates :artist_name, presence: true

  validate :song_not_repeated?
  validate :release_year_validation
  validate :release_year_year


  def song_not_repeated?
    @song = Song.find_by(title: self.title)
    if !@song
      true
    else
      if @song.release_year != nil
        if @song.release_year != self.release_year
          true
        else
          false
          errors.add(:title, "Song already exists for that year")
        end
        errors.add(:release_year, "No release year")
      end
    end
  end

  def release_year_validation
    if self.released == true
      if self.release_year != nil || self.release_year != ""
        true
      else
        false
      end
    else
      true
    end
  end

  def release_year_year
    self.release_year.to_i <= Time.now.year
  end
end
