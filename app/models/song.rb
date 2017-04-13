class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name]}
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released
  validate :release, unless: "release_year.nil?"

  def release
    errors.add(:release_year, "can't be in the future") if released && release_year > Date.current.year
  end
end
