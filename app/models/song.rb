class Song < ActiveRecord::Base

  validate :validate_release_year
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "Your title cannot be repeated by the same artist in the same year"
    }

  def validate_release_year
    if released && release_year == ""
      errors.add(:release_year, "Please specify what year the song was released")
    elsif released && release_year.class != Fixnum
      errors.add(:release_year, "Release year must be a valid integer")
    elsif released && release_year > Date.today.year
      errors.add(:release_year, "The release year cannot be greater than the current year")
    elsif !released && release_year == ""
      return true
    elsif released && release_year <= Date.today.year
      return true
    end
  end
end
