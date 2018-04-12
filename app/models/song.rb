class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  # validates :release_year, presence: true, if: :was_released?   
  # validate :valid_release_year?
  with_options if: :was_released? do |s|
    s.validates :release_year, presence: true
    s.validate :valid_release_year?, :released_once_this_year?
  end


  def was_released?
    self.released
  end

  def valid_release_year?
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "released year can't be in the future") 
    end
  end

  def released_once_this_year?
    song = Song.find_by(title: self.title)
    if !!song
      if release_year == song.release_year && artist_name == song.artist_name && title == song.title
        errors.add(:release_year, "cannot release same song twice this year")
      end 
    end
  end
end
