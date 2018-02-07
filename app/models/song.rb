class Song < ActiveRecord::Base
	validates :title, presence: true, 
		uniqueness: { 
			scope: :artist_name && :release_year,
			message: "Song cannot be repeated by the same artist in the same year"
		}
	validates :artist_name, presence: true
	validates :released, inclusion: { in: [true, false]}
	validates :release_year, presence: true, 
		unless: "released == false", 
		numericality: { less_than_or_equal_to: Time.now.year }
end
