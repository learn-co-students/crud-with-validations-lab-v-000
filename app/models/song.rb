class Song < ActiveRecord::Base
  CURRENTYEAR = Time.now.year
  validates :title, presence: true
  validates_uniqueness_of :title, if: :artist_same_and_one_year?
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :song_released?
  validates :artist_name, presence: true


  def artist_same_and_one_year?

    song = Song.find_by(title: title, artist_name: artist_name)
    if !song.nil? && (song.created_at.year == release_year || song.created_at.year == CURRENTYEAR) && (id.nil? || song.id != id)
      errors.add(:title, "same song title cannot be used for one artist per year")
    end
  end

  def song_released?
    if released? && (release_year.nil? || release_year >= CURRENTYEAR)
      errors.add(:release_year, "must be filled in")
    end
  end


end
