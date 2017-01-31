class Song < ActiveRecord::Base

	validates :title, presence: true 
	validates :title, uniqueness: { scope: :release_year }
	validates :released, inclusion: { in: [ true, false ] }
	validates :artist_name, presence: true 


	with_options if: :released? do |song|
		song.validates :release_year, presence: true
		song.validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: ->(_song){ Date.current.year }}
	end 

	with_options if: :unreleased? do |song|
		song.validates :release_year, presence: false
	end 


	def unreleased?
		released == false
	end
	
	def released?
		released == true
	end

end
