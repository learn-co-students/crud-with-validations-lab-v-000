class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: :released
  validate :release_year_cannot_be_in_future
  validate :artist_cannot_release_same_song_twice_per_year
  validates :title, uniqueness: {scope: :release_year}
  validates :title, uniqueness: {scope: :artist_name}
  validates :artist_name, presence: true

  def release_year_cannot_be_in_future
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "can't be released after today")
    end
  end

  def artist_cannot_release_same_song_twice_per_year

  end



end
