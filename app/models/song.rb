class Song < ActiveRecord::Base
	validates :title, presence: true
	validate :year_released
	validate :same_title_different_year, on: :create


	def same_title_different_year
		if released
			if Song.find_by(:title => title)
				song = Song.find_by(:title => title)
				if song.release_year == release_year
					errors.add(:release_year, " and title cannot match for 2 different songs.")
				end
			end
		end
	end

	def year_released
		if released == true
			if release_year.to_i > Time.now.year
				errors.add(:release_year, " can't be in the future.")
			end

			if release_year.nil?
				errors.add(:year, "Release year can't be blank.")
			end
		end
	end

end
