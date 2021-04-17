class Song < ApplicationRecord
    validates :title, presence: true
    validates_uniqueness_of :title, scope: [:release_year, :artist_name]
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: -> { released == true }
    validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.current.year }, if: -> { released == true }
    validates :artist_name, presence: true
end
