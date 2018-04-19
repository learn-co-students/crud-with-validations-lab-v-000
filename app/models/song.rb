class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: {in: [true, false]}
  
  validate :title_unique_by_artist_per_year
  validate :release_year_optional_if_unreleased
  
  def title_unique_by_artist_per_year
    if !!self.release_year
      songs = Song.where(:artist_name => self.artist_name, :title => self.title, :release_year => self.release_year).to_a
      songs = songs.reject{|song| song.id == self.id}
      if !songs.empty?
        errors.add(:title, "cannot be repeated by the same artist in the same year")
      end
    else
      true
    end
  end
  
  def release_year_optional_if_unreleased
    if self.released
      if !( !!self.release_year && self.release_year <= Time.now.year )
        errors.add(:release_year, "must be less than or equal to current year if song is released")
      end
    else
      true
    end
  end
  
end
