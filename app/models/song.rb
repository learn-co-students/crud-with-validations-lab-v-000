class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :release_year}
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, numericality: {less_than_or_equal_to: Time.current.year}, allow_blank: true
  validates :release_year, presence: true, if: :released?
  validates :artist_name, presence: true

  def released?
    if released && release_year.blank?
      errors.add(:release_year, "is required")
    end
  end
end
