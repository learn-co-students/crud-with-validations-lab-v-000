class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
#  validates :release_year, numericality: { less_than_or_equal_to: 2016 }
  validate :must_have_release_year_if_released,
           :release_date_cannot_be_in_the_future

  private

  def must_have_release_year_if_released
    if released && release_year.blank? #&& (!released && !release_year.blank?)
      errors.add(:release_year, "must have release year if released")#, or release year must be blank if not released.")
    end
  end

  def release_date_cannot_be_in_the_future
    if release_year && release_year > Time.now.year
        errors.add(:release_year, "can't be in the future")
    end
  end

end
