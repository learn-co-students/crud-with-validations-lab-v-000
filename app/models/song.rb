class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:artist_name, :release_year]}
  validates :release_year, presence: true,  if: :released?
  validates_absence_of :release_year, unless: :released?
  validates :release_year, numericality: {less_than_or_equal_to: :current_year, allow_nil: true}
  validates :artist_name, presence: true

  def current_year
    Date.current.year
  end


end
