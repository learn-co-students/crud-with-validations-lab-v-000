class Song < ApplicationRecord
   validates :title, presence: true
   validates :artist_name, presence: true
   validate :released?
   validate :future_release?

   def released?
    if released == true && release_year == nil
      errors.add(:release_year, "must have release year")
    end
  end

  def future_release?
    if release_year && release_year > Date.today.year
      errors.add(:release_year, "release year cannot be in the future")
    end
  end
end
