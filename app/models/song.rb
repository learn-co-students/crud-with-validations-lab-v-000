class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true

  validates :title, uniqueness: { scope: :release_year, message: "must be unique per artist per year"}
  validates :released, inclusion: { in: [true, false] }


  def release_info
    if self.released && !self.release_year
      errors.add(:release_year, "A Song needs a release year")
    else self.release_year && self.release_year > Date.today.year
      errors.add(:release_year, "release year can't be from the future")
    end
  end

end
