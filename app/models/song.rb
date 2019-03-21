class Song < ActiveRecord::Base
	validates :title, presence: true
	validate :release_year_and_released_are_congruent
	validate :release_year_not_in_future
	validate :same_song_released_twice_in_one_year

	def release_year_and_released_are_congruent
		if self.released.present? && (self.release_year == nil)
			errors.add(:released, "must have release year")
		end
		if (self.released == nil) && self.release_year.present?
			errors.add(:release_year, "must be released")
		end
	end

	def release_year_not_in_future
		if self.released.present? && self.release_year.present? && self.release_year > Date.today.year
			errors.add(:release_year, "cannot be in the future")
		end
	end

	def same_song_released_twice_in_one_year
		Song.all.each do |song|
			if song.title == self.title && song.release_year == self.release_year && self.new_record?
				errors.add(:title, "can't release same song in one year")
			end
		end
	end

end