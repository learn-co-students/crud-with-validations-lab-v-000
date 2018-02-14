class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :artist_name, presence: true
  validate :release_check
  validate :year_check

  def release_check
    if released == true
      if release_year == nil
        errors.add(:released, "needs a release year")
      end
    end
  end

  def year_check
    if release_year != nil
      if Date.today.year < release_year
        errors.add(:release_year, "can't be in the future")
      end
    end
  end

end
