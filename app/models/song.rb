class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year], message: "A song cannot be released twice in the same year" }
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released

  validate :release_year_in_the_past_or_current_year

  def release_year_in_the_past_or_current_year
    if released && release_year
      if release_year > Date.today.year
        errors.add(:release_year_not_in_the_future, "Release year has to be in the past or current year")
      end
    end
  end
  
end
