class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :artist_name, presence: true
  validate :release_year_validation

  def release_year_validation
    current_year = DateTime.now.year.to_i
    if self.released
      #binding.pry
      if self.release_year == nil
        errors.add(:release_year_validation, "If album is released, must have release year.")
      else
        if self.release_year > current_year
          errors.add(:release_year_validation, "Release year cannot be in the future if album is already released.")
        end
      end
    end
  end

end
