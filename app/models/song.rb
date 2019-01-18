class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :release_year, presence: true, if: :released?, numericality: { less_than_or_equal_to: Date.current.year }

  def released?
    released == true
  end

end
