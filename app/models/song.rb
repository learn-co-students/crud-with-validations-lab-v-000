class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name]}
  validates :artist_name, presence: true
  validate :valid_release?

  def valid_release?
    if released && !release_year
      errors.add(:release_year, "Must have release year if released")
    end
    if release_year && release_year > Date.today.year
      errors.add(:release_year, "Must be less than or equal to the current year")
    end
  end
end
