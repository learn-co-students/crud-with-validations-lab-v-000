class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :artist_name, presence: true
	validates :released, inclusion: { in: [true, false] }
	validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "should happen once per year per artist name" }
	validates :release_year, presence: true, if: :released, numericality: { less_than_or_equal_to: Date.current.year, only_integer: true }
end
