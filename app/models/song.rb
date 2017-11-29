class Song < ActiveRecord::Base
  # :scope limits uniqueness check to release_year (check there is at most one song with a given title per release_year)
  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [ true, false ] }
  # if :released is truthy, release_year must have a numerical value <= current year
  validates :release_year, presence: true, if: :released,
    numericality: { less_than_or_equal_to: Time.now.year }
  validates :artist_name, presence: true
  validate :check_release_year

  def check_release_year
    if released && !release_year
      errors.add(:release_year, 'Release year cannot be blank.')
    end
  end

end
