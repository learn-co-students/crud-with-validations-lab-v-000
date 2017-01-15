class Song < ActiveRecord::Base
  validates_presence_of :title, :artist_name
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :check_release?
  validates :release_year, presence: true, if: :check_release?
  validate :duplicates
  validate :release

  def check_release?
    self.released == true
  end

  def duplicates
    if !self.title.nil?
      song = Song.find_by(title: self.title)
      if !song.nil?
        if song.artist_name == self.artist_name && song.release_year == self.release_year
          errors.add(:title, "Cannot be repeated by the same artist in the same year.")
        end
      end
    end
  end

  def release
    self.released == true || self.released == false
  end

end
