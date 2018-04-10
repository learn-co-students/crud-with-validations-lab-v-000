class Song < ActiveRecord::Base
	validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year], message: "Song cannot be repeated twice in the same year!" }
	validates :artist_name, presence: true
	validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.today.year }, uniqueness: true, if: :released
	validates :released, inclusion: [true, false]
end
