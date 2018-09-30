class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :artist_name, presence:true
	validates :release_year, presence:true, if: :released
	validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}, if: :released
	validates_uniqueness_of :title, scope: [:artist_name, :release_year], message: "Song title cannot be repeated by same artist in the same year"


end
