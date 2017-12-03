class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :artist_name, presence: true
  # validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?
  validate :present_release_date

  def present_release_date
    if release_year.present? && release_year > Time.now.year
      errors.add(:release_year, "Release Year can't be in the future!")
    end
  end
end
