class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :release_year_must_be_present_when_released_is_true
  validates :release_year, numericality: { less_than_or_equal_to: (Date.today.year)}, if: :release_year_must_be_present_when_released_is_true
  validate :song_duplication_check


  def song_duplication_check
    Song.all.each do |song|
      if self.title == song.title && self.release_year == song.release_year && self.artist_name == song.artist_name
        errors.add(:title)
      end
    end
  end

  def release_year_must_be_present_when_released_is_true
    self.released == true
  end


end
