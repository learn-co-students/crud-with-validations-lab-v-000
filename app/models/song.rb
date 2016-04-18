class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :artist_name, presence: true
	validates :genre, presence: true
	validate :missing_release_year, :future_release_year, :same_year

	def missing_release_year
		if release_year == nil
			errors.add(:release_year, "must be present if song has been released") unless released == false
		end
	end	

	def future_release_year
		if release_year && release_year > Time.now.year
			errors.add(:release_year, "must be in the past")
		end
	end

	def same_year
		if Song.find_by(:title => title)
			@same_song_year = Song.find_by(:title => title).release_year
		end

		if @same_song_year == release_year && release_year != nil
			errors.add(:release_year, "can't release same song in the same year")
		end
	end
end
