class Song < ActiveRecord::Base

	validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name]}
	validates :released, inclusion: {in: [true, false]}
	validates :artist_name, presence: true

	validates :release_year, numericality: {
		only_interger: true,
	  presence: true, if: :released?,
	  less_than_or_equal_to: Date.current.year, if: :released?
	}

	def released?
		released
	end
end
