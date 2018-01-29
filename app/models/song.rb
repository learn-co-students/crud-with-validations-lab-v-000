class Song < ActiveRecord::Base
  validates_presence_of :title
  validates :release_year, format: {with: /\d{4}/}, if: :released
  validate :future_release_year
  validates :title, uniqueness: { scope: :release_year,
    message: "should happen once per year" }

  def future_release_year
    if self.released  && self.release_year.present? && self.release_year.to_i > Date.today.year
      errors.add(:release_year, "date can't be in the future")
    end
  end
end