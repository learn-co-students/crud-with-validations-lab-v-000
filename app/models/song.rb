class Song < ActiveRecord::Base
  validates :title, presence: true
  # validates :released, presence: true
  validate :release_year_if_released
  validate :release_year_in_future
  validate :already_released
  

  def release_year_if_released   
    if released == true && release_year == nil
      errors.add(:release_year, "If song is released it must have a release year")
    # elsif released == false && release_year 
    #   errors.add(:release_year, "Song isn't released, can't have a release year")

    end
  end

  def release_year_in_future
    if release_year
      if released == true && release_year > Date.today.year
        errors.add(:release_year, "Release year can't be in the future!")
      end
    end
  end

  def already_released
    if song = Song.find_by(title: self.title) 
      errors.add(:release_year, "Song already realeased that year!") if song.release_year == self.release_year
    end
  end
end
