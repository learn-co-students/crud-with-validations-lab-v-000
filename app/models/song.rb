class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: {in: [true, false]}
  validate :release_year_presence_if_released?
  validate :release_year_before_current?
  validate :same_title_same_year?


  def release_year_presence_if_released?
    if released and !release_year.present?
      errors.add(:release_year, "can't be blank")
    end
  end

  def release_year_before_current?
    if released and release_year.present? and release_year > Time.now.year
      errors.add(:release_year, "must be before current year")
    end
  end

  def same_title_same_year?
    song = Song.find_by(:title => title)
    if song && song.artist_name == artist_name && song.release_year == release_year
      errors.add(:title, "cannot be repeated by the same artist in the same year")
    end
  end

end
