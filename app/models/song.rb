class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year && :artist_name, message: "invalid if an artist tries to release the same song twice in a year" }
  validates :released, inclusion: { in: [true, false] }
  # validates :release_year, presence: true, if: :released
  # validates :release_year, numericality: { only_integer: true }
  # validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  with_options if: :released do
    validates :release_year, presence: true
    validates :release_year, numericality: { only_integer: true }
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end


  validates :artist_name, presence: true

end
