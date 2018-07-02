class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, :inclusion => {:in => [true, false]}
  validates :genre, presence: true
  validates_uniqueness_of :release_year, scope: %i[title]

  with_options if: :song_released? do |release|
    release.validates :release_year, presence: true
    release.validate :release_year_cannot_be_in_the_future
  end

  def song_released?
    released?
  end

  def release_year_cannot_be_in_the_future
    if release_year.present? && release_year > Date.today.year.to_i
      errors.add(:release_year, "can't be in the future")
    end
  end

end
