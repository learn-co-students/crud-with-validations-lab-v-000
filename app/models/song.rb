class Song < ApplicationRecord
  validates :title, presence: true
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year, allow_nil: true}

  #is valid without release year when released is false (FAILED - 3)
  validates_uniqueness_of :title

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end


    def released?
      released
    end


end
