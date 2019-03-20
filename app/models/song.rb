class Song < ActiveRecord::Base
	validates :title, presence: true
	validate :release_year_and_released_are_congruent
	validate :release_year_not_in_future
	# validates :artist, :release_year, uniqueness: true
	# validates :released, inclusion: { in: [ true, false ] }
	# validates :release_year, numericality: { only_integer: true }
	# validates :artist_name, presence: true

	def release_year_and_released_are_congruent
		if self.released && self.release_year.present? 
		else !(self.released && self.release_year.present?)
		end
	end

	def release_year_not_in_future
		!(self.released && self.release_year.present? && self.release_year < Date.today.to_time.to_i)
	end

end