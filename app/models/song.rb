class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }
  validates :released, inclusion: [true, false]
  validates :release_year, presence: true, if: :released
  validate :non_future_release_year, if: :released

  def non_future_release_year
    if release_year == nil || release_year > Date.today.year
      errors.add(:release_year, "can't be in the future")
    end
  end
end
