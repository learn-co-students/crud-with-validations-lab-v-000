class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }

  #see Rails Guides AR Validations 2.11, setting uniqueness scope
  validates :title, uniqueness: { scope: :release_year }

  validates :release_year, if: :released?, presence: true, numericality: { less_than_or_equal_to: Date.today.year }

end
