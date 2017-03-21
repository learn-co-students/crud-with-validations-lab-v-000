class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false], message: "%{value} is not a valid value"  }
  validate :validate_release_year

  def validate_release_year
    if released == true && !release_year
      errors.add(:release_year, "must be specified if Song is released")
    elsif release_year > Date.today.year
      errors.add(:release_year, "must not be in the future")
    end
  end
end
