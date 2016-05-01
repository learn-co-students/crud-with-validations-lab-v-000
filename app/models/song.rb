class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: true, unless: "release_year.nil?"
	validates :released, inclusion: { in: [true, false] }
	with_options if: :released? do |rel|
		rel.validates :release_year, presence: true
		rel.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
	end
	validates :artist_name, presence: true


end
