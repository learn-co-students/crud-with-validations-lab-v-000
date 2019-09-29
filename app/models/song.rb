
class Song < ApplicationRecord
  validates :title, :artist_name, presence: true
  validates :released, exclusion: { in: [nil] }
  validates :title, uniqueness: { scope: :release_year,
   message: "should happen once per year" }
  validate :relased
  validate :release_date


  def relased
    if released == true && release_year == nil
      errors.add(:released, "Must be false if there is no relase year")
    end
  end

  def release_date
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "Can't be in the future")
    end
  end
end
