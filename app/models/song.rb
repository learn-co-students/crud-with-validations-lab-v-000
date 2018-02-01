class Song < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :release_year, if: :was_released?
  validates :release_year, numericality: { only_interger: true, less_than_or_equal_to: Time.now.year }, if: :was_released?
  validates_presence_of :artist_name
  validate :unique_to_artist_and_year


  def was_released?
    released == true
  end

  def unique_to_artist_and_year
    if Song.find_by(title: title, artist_name: artist_name, release_year: release_year)
      errors.add(:title, "Asong of this name already exists under this artist")
    end
  end
end
