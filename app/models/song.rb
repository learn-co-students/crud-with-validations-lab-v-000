class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: :released
  validates :title, uniqueness: { scope: :release_year,
    message: "should happen once per year" }

  validate :present_release

  def present_release
    if release_year.present? && release_year > Time.now.year
      errors.add(:release_year, "no")
    end
  end

end
