class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: { scope: [:artist_name, :release_year] }

	validates :released, inclusion: { in: [true, false] }

	with_options if: :is_released? do |s|
		s.validates :release_year, presence: true
		s.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
	end

	validates :artist_name, presence: true

	def is_released?
		released
	end
end
