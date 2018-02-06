class Song < ActiveRecord::Base

	validates :title, presence: true, uniqueness: {:scope => :release_year, :scope => :artist_name}
	validates :released, inclusion: { in: [true, false] }

	validates :release_year, numericality: {:only_integer => true, less_than: 2016}, :unless => "!released"

end
