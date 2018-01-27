class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :release_year, presence: true, if: :released?
  validate :future_release_year?

  def released?
    released == true
  end

  def future_release_year?
    if !release_year.nil? && release_year > Date.today.year
      errors.add(:release_year, "can't be a future release year")
    end
  end

end
