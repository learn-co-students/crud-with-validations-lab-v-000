class Song < ActiveRecord::Base
  validates :title, presence:true
  validates :release_year, presence: true, if: :released?
  validate :release_year_cannot_be_future
  validates :title, uniqueness: { scope: [:release_year, :artist_name]}

  def release_year_cannot_be_future
    if release_year.to_i > Date.current.year
      errors.add(:release_year, "Release year can't be in the future")
    end
  end
end
