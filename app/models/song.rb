class Song < ActiveRecord::Base
  validates :title, uniqueness: { scope: :artist_name, scope: :release_year }, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :was_released?, numericality: { less_than_or_equal_to: Date.today.year }
  validates :artist_name, presence: true

  def was_released?
    !!released
  end

end
