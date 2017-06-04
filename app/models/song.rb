class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :dupe_song
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, numericality: {
    less_than_or_equal_to: 2017}, if: :released?
  validates :artist_name, presence: true

  def dupe_song
    if Song.find_by(title: title, artist_name: artist_name,
       release_year: release_year)
      errors.add(:title, "must not be duplicated.")
    end
  end
end
