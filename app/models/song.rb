class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: {
    scope: %i[release_year artist_name],
    message: "title can't be repeated by the same artist in the same year"
  }

  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true

  validate :valid_release_year


  def valid_release_year
    if released && !release_year.present?
      errors.add(:release_year, "can't be blank if the song has been released")
    elsif release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "release year must be older than this year")
    end
  end

end
