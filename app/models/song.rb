class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "must be unique per artist per year" }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true

  # def release_info
  #   if self.released && !self.release_year
  #     errors.add(:release_year, "A Song needs a release year")
  #   else self.release_year && self.release_year > Date.today.year
  #     errors.add(:release_year, "release year can't be from the future")
  #   end
  # end

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end

  def released?
    released
  end

end
