class Song < ActiveRecord::Base
  validates :title, presence: true
  #validates :released, inclusion: {in: [true, false]}
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, unless: :not_released
  validates :artist_name, presence: true
  validate :released_year_required_when_released, :cannot_release_same_song_title_in_same_year

  def not_released
    self.released == false
  end

  def released_year_required_when_released
    if self.released == true && self.release_year.to_s.empty?
      errors.add(:release_year, "must include the year released")
    end
  end

  def cannot_release_same_song_title_in_same_year
    if Song.where("artist_name='#{self.artist_name}'").any? {|song| song.release_year == self.release_year && song.title == self.title}
      errors.add(:title, "songs by an artist cannot be released with the same name in the same year")
    end
  end
end
