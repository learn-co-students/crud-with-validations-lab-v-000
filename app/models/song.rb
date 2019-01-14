class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [true, false]}
  with_options if: :is_released? do |released|
    released.validates :release_year, presence: true
    released.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }

end

def is_released?
  released
end

end
