class Song < ApplicationRecord
  validates :title, :artist_name, :genre, presence: :true

  with_options if: :song_is_released do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { only_integer: true }
    song.validate :release_year_valid?
    song.validates :title, uniqueness: { scope: :release_year, message: "Cannot release same song twice in one year" }
  end

  validate :release_year_valid?

  def song_is_released
    released == true
  end

  def release_year_valid?
    if release_year.present? && release_year > Time.current.year
      errors.add(:release_year, "release year can't be in the future")
    end
  end
end
