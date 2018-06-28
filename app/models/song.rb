class Song < ActiveRecord::Base

	validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year] }
	validates :artist_name, presence: true
	validates :released, inclusion: { in: [true, false] }
	with_options if: :released do |song|
		song.validates :release_year, presence: true
		song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}
	end

	def is_released?
		!!released
	end

end
