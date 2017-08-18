class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: :released?
  validate :release_date_cannot_be_in_the_future
  validates :title, uniqueness: true, if: :release_year, uniqueness: true

  def release_date_cannot_be_in_the_future
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "can't be in the future")
    end
  end

end
