class Song < ActiveRecord::Base
  validate :release_year_cannot_be_in_the_past

  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year}
  validates :release_year, presence: true, if: :released?
  validates :released, inclusion: { in: [ true, false ] }

  def release_year_cannot_be_in_the_past
    errors.add(:release_year, "can't be in the past") if
      !release_year.blank? && release_year >= Date.today.year
  end

end
