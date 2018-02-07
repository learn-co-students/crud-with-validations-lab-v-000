require 'date'
class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: true, if: :title_released_this_year
	validates :release_year, presence: true, if: :song_released
	validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :song_released

	def song_released
		self.released 
	end

	def title_released_this_year
		Song.all.where("release_year=?", release_year).size!=0
	end

end
