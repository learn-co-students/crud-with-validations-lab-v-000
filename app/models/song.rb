class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year, message: "must be unique per artist per year"}
  validates :released, inclusion: { in: [true, false] }
  validate :release_info
  validates :artist_name, presence: true

  def release_info
    if (released == true) && !release_year
      errors.add(:release_year, "Please enter a release year; it can't be blank if Song is released")
    else !!release_year && release_year > Date.today.year
      errors.add(:release_year, "release year can't be from the future")
    end
  end

end
