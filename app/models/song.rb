class YearReleased < ActiveModel::Validator
	def validate(record)
		if record.release_year.to_i > Time.now.year
			record.errors[:invalidYear] = "Invalid year"
		end
		song = Song.find_by(title: record.title, artist_name: record.artist_name)
		if song
			record.errors[:invalidSong] = "Song released within past year" if song.release_year.to_i == record.release_year.to_i
		end
	end
end

class Song < ActiveRecord::Base
	include ActiveModel::Validations
	validates :title, presence: true
	validates :released, inclusion: {in: [true, false]}
	validates :artist_name, presence: true
	validates :release_year, presence: true, if: :released?
	validates_with YearReleased
	validates :genre, presence: true 
end
