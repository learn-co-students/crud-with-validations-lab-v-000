class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :released, inclusion: { in: [true, false]}
	validates :release_year, presence: true, if: :released
	validates :release_year, numericality: { only_integer: true }, if: :released
	validates :release_year, inclusion: { in: 1900..Date.today.year}, if: :released
	validate :same_song_within_a_year, if: :released

	def same_song_within_a_year
		song = Song.find_by(title: self.title)

		if !!song && song.id != self.id
			if song.title == self.title && song.release_year == self.release_year
				errors.add(:release_year, "Artist can't release same song within a year")
			end
		end
	end

end
