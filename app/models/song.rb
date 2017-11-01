class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, :numericality => { less_than_or_equal_to: Date.current.year }, unless: :is_not_released?
  validates :artist_name, presence: true

  def is_not_duplicate?
    !Song.find_by(title: title, release_year: release_year)
  end

  def is_not_released?
    !released
  end
end
