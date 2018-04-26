require 'date'

class Song < ActiveRecord::Base
	validates :title, presence: true#, uniqueness: {scope: :year, message: ""}
	validates :released, inclusion: {in: [true, false]}
	validates :release_year, presence: true, numericality: {only_integer: true, less_than_or_equal_to: Date.today.year}, if: :release_year_validation
	validates :artist_name, presence: true 
	validate :same_song_title_in_same_year_by_artist


	def release_year_validation 
		!!released
	end 

	def same_song_title_in_same_year_by_artist
		if song = Song.find_by(title: title)
			if song.artist_name == artist_name && song.release_year == release_year
				errors.add(:title, "Artist cannot release songs with the same title in the same year")
			end 
		end 
	end 
end
