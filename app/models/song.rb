class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "cannot be repeated by the same artist in the same year"
  }
  validates :released, inclusion: { in: [true, false] }
  validate :released_year
  validates :artist_name, presence: true

  def released_year
    if released
      if release_year.nil?
        errors.add(:release_year, "year must not be empty")
      elsif release_year > Date.today.year
        errors.add(:release_year, "must be on or before this year")
      end
    end
  end
end
