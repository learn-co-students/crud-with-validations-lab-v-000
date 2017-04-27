class Song < ActiveRecord::Base
	validates :title, presence: true
	validate :no_repeated_artist_in_same_year
	validate :release_year_validations

	def no_repeated_artist_in_same_year
		if Song.where(title: title, artist_name: artist_name, release_year: release_year) != []
			errors.add(:no_repeated_artist_in_same_year, "Cannot repeat the same song title for an artist in the same year")
		end
	end

	def release_year_validations
		if released == true && release_year == nil
			errors.add(:release_year_validations, "Must include release year if marked released")
		end
		if release_year != nil && release_year > Date.current.year
			errors.add(:release_year_validations, "Release year cannot be in the future.")
		end
	end

end
