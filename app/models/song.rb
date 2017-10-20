class Song < ActiveRecord::Base

	CURRENT_YEAR = 2017
	validate :title, :has_repeats?
	validate :release_year, :was_released?
	validates :title, presence: true
	validates :released, inclusion: {in: [true, false]}
	validates :release_year, numericality: {less_than_or_equal_to: CURRENT_YEAR} :unless 
	validates :artist_name, presence: true

	def was_released?
		if self.released?
			errors.add(:release_year, "If the song has been released, it must have a release year.") if release_year.nil?
		end
	end

	def has_repeats?
	 	if Song.all.any? {|song| song.title == self.title && song.release_year == self.release_year && song.artist_name == self.artist_name}
			errors.add(:title, "Artists can't have repeats of song names in the same year.")
		end
	end

end
