class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: { scope: [:release_year, :artist_name]}
	validates :released, inclusion: { in: [true, false] }
	validates :artist_name, presence: true

	with_options if: :is_released? do |song|
		song.validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.today.year }
	end


	def is_released?
		self.released == true
	end
end
