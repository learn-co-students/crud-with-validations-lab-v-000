class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, presence: true, if: :released
  validates :release_year, uniqueness: true
  validates :artist_name, presence: true
  validate :date_cannot_be_in_the_future


  def date_cannot_be_in_the_future
    if release_year.present? && release_year >= Date.today.year
      errors.add(:release_year, "can't be in the future")
    end
  end
end
