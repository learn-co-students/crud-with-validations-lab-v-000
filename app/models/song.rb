class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: {scope: :release_year && :artist_name}
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :released
  validate :when_released

  def when_released
    if release_year.present? && release_year >= Time.now.year
      errors.add(:release_year, "Error with the year")
    end
  end
end
