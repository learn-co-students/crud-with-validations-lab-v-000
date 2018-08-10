class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { less_than_or_equal_to: :current_year }, allow_nil: true

  def released?
    released
  end

  def current_year
    Time.now.year
  end
end
