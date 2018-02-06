class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :artist_name, presence: true
  validates :artist_name, uniqueness: { scope: :release_year }
  validates_inclusion_of :released, in: [true, false]
  validates_presence_of :release_year, if: :released
  validate :year

  def year
    if release_year
      date = Date.today
      if release_year > date.year
        errors.add(:release_year, 'release_year must not be greater than current year')
      end
    end
  end

end
