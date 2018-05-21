

class Song < ActiveRecord::Base
 validate :release_year_only_w_released, :release_year_validate
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: true

  def release_year_only_w_released
    if released == true
      if !release_year
      errors.add(:release_year, "Release year can't be empty")
    end
  end
end

    def release_year_validate
      if release_year
        if  release_year > Date.current.year
          errors.add(:release_year, "Release year cannot be in the future")
        end
      end
  end
end
