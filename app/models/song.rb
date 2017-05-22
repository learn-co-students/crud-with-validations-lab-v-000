class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year,
    presence: true,
    inclusion: { in: 1900..Date.today.year },
    unless: :is_not_released?

  private

  def is_not_released?
    released == false
  end
end
