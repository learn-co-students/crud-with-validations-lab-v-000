class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false]}
  validates :artist_name, presence: true
  validate :pushed_back
  validate :cater_v

  def pushed_back
    if release_year && release_year > Time.now.year
      errors.add(:release_year, "release year cannot be greater than current year.")
    end
  end

  def cater_v
    if released && !release_year
      errors.add(:release_year, "Year is required for a released song.")
    end
  end
end
