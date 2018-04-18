
class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :released, inclusion: {in: [true, false]}
	validates :artist_name, presence: true
	validate :not_in_future, :not_in_same_year, :release_year_if_released

	def not_in_future
		if !release_year.nil? && release_year > Time.new.year
			errors.add(:release_year, 'must be current year or earlier')
		end
	end

	def not_in_same_year
		Song.all.each do |song|
			if song.title == title && song.release_year == release_year && song.artist_name == artist_name
				errors.add(:title, "cannot share title with another song from same year")
			end
		end
	end

	def release_year_if_released
		if released
			errors.add(:release_year, "must have release year if song has been released") if release_year == nil
		end
	end


end
