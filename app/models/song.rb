class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: %w(true false)}
  validates :release_year, presence: true, unless: :not_released?
  validates :release_year, numericality: { less_than_or_equal_to: 2018}
  validates :artist_name, presence: true

  def not_released?
    self.released == false
  end
end
