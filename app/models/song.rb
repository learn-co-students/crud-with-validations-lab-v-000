class Song < ActiveRecord::Base

  validates :title, presence: true
  validate :valid_release_year
  validate :release_year_if_released
  validates :title, uniqueness:  { :scope => :release_year }
  

  def release_year_if_released
    if released == true && release_year == nil
      errors.add(:release_year, "Must have release year if released")
    end
  end

  def valid_release_year
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "No futures dates")
    end
  end

end
