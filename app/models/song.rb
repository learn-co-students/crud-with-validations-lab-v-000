class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year}
  validates :release_year, presence: true, if: :released
  validate :valid_year

  def valid_year
    if release_year
      if Date.today.year < release_year
        errors.add(:release_year, "can't be released in the future")
      end
    end
  end
end
