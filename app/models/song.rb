class Song < ActiveRecord::Base
  validate :release_year_cannot_be_in_the_future
  validates :title, presence: true, uniqueness: { scope: :release_year,
    message: "should happen once per year"}
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: "released?"
  validates :genre, presence: true

  def release_year_cannot_be_in_the_future
    if release_year.present? && release_year > Date.today.year
      errors.add(:relese_year, "can't be in the future")
    end
  end
end
