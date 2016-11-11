class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { less_than: Date.today.year }, allow_nil: true

  def released?
    released
  end
end
