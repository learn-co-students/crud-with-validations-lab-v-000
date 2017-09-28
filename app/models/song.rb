require 'pry'
class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :released, inclusion: { in: [ true, false ] }
	validates :artist_name, presence: true
	validate :not_repeated_in_same_year
	validate :release_year_presence_and_correctness


	def not_repeated_in_same_year
		@song = Song.find_by(title: title)
		if @song && @song.artist_name == artist_name && @song.release_year == release_year
			errors.add(:title, 'cannot be repeated by same artist in same year.')			
		end
	end

	def release_year_presence_and_correctness
		if released
			if release_year == nil
				errors.add(:release_year, 'must exist if the song is released')
			end

			if release_year && release_year > Time.new.year
				errors.add(:release_year, 'must be less than or equal to current year')
			end
		end
	end



end
