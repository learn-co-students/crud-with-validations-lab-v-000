class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year],
    message: "can't be repeated by the same artist in the same year"
  }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?
  validate :not_future_year

  def not_future_year
    if !release_year.nil? && release_year > Date.today.year
      errors.add(:release_year, "can't be in the future")
    end
  end
end
