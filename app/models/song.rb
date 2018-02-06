class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  validates :released, inclusion: {in: [true, false]}

  validates :release_year, presence: true, if: :released?

  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}, if: :released?

end
