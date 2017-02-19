class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :release_year, presence: true, if: "released"
	validate :check_year
	validate :released_twice


	def check_year
		errors.add(:release_year, "Song is in future") unless release_year.to_i <= Date.today.year.to_i
	end

	def released_twice
		if @songs = Song.where(:release_year => release_year)
			@songs.each do |song| 
				if song.title == title
					errors.add(:title, "released twice")
				end
			end
		end
	end
end
