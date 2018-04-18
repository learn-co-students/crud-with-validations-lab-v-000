class SongValidator < ActiveModel::Validator
	def validate(song)
		if song.release_year == nil && song.released == true
			song.errors[:base] << "The song must have a release year if it is released."
		end

		if song.release_year != nil && song.release_year > Date.today.year
			song.errors[:base] << "The song cannot have a release year in the future"
		end

		
		# if (Song.find_by title: song.title).release_year = song.release_year
		# 	song.errors[:base] << "You can't release the same song twice in one year."
		# end

	end
end