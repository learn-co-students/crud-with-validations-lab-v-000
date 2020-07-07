class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year }
    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: { less_than_or_equal_to: Date.current.year }, if: :released?
    validates :artist_name, presence: true
    validates :genre, presence: true
end
