class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, numericality: {less_than: Time.now.year}, if: :released?
  validates :release_year, presence: true, if: :released?
  validate :song_title_year_check

  def released?
    released == true
  end

  def song_title_year_check
    if Song.find_by(title: title, artist_name: artist_name, release_year: release_year)
      errors.add(:title, "cannot be repeated by the same artist in the same year")
    end
  end

end
