class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: true, if: :artist_and_year_matches?

	validates :release_year, numericality: {allow_nil: true}, unless: :released?
	validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.now.year }, if: :released?

	validates :artist_name, presence: true
	private

	def artist_and_year_matches?
		Song.find_by(artist_name: artist_name, release_year: release_year)
	end

	def current_year
		Time.now.year
	end

	def released?
		released
	end

end
