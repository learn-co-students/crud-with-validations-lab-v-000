class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year,
    message: "cannot release song twice in one year" }
  validates :release_year, presence: true, if: :released
  validate :release_year_cannot_be_in_the_past

  def release_year_cannot_be_in_the_past
    if release_year.present? && release_year > Time.new.year
      errors.add(:release_year, "can't be in the future")
    end
  end
end
