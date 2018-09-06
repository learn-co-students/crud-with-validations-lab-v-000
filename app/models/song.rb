class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :artist_name, presence: true
	validates :released, inclusion: { in: [true, false] }
	validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "should happen once per year per artist name" }
	validates :release_year, presence: true, if: :released
	validates_with GoodYearValidator

#	validates :release_year, presence: false, if: :bad_year?
=begin
	validates :release_year, numericality: { 
		only_integer: false, 
		less_than_or_equal_to: ->(_song) { Date.current.year }
	}
=end

	def good_year?
		if release_year && released
			#binding.pry
			(release_year <= Date.current.year)
		else
			false
		end
	end
end
