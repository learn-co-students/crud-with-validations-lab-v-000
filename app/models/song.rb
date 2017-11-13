class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released, numericality: { less_than_or_equal_to: Time.now.year }
  validates :released, inclusion: { in: [ true, false ] }
  validate :check_release_year

  def check_release_year
    if released && !release_year
      errors.add(:release_year, 'Release year cannot be blank.')
    end
  end

end
