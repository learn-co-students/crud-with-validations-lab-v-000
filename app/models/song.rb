class Song < ActiveRecord::Base

	validate :title, :has_repeats?
	validates :title, presence: true
	validates :released, inclusion: {in: [true, false]}
	validates :release_year, presence: true, if: :was_released?
	validates :release_year, numericality: {less_than_or_equal_to: CURRENT_YEAR}, if: :was_released?
	validates :artist_name, presence: true

	def was_released?
		released == true
	end

	def has_repeats?
	 	if Song.all.any? {|song| song.title == self.title && song.release_year == self.release_year && song.artist_name == self.artist_name}
			errors.add(:title, "Artists can't have repeats of song names in the same year.")
		end
	end

end
end
