require "time"

class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :artist_name, presence: true
	validates :released, inclusion: { in: [true, false] }
	validate :valid_release_year, :duplicate_song, on: :create


	def valid_release_year
		if released.present? && (release_year.to_s.to_i > Date.current.year)
			errors.add(:release_year, "Release year can not be in the future.")
		elsif released.present? && release_year.nil?
			errors.add(:release_year, "Please add a release year.")
		else
			true
		end
	end

	def duplicate_song
		duplicate = Song.all.select{|song| song.title == self.title}
		if duplicate.present?
			if (duplicate.first.release_year == self.release_year)
				errors.add(:release_year, "Can't add duplicate songs.")
			end
		else
			true
		end
	end
end
