class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :genre, presence: true
	validates :title, :uniqueness => { :scope => [:release_year, :artist_name] }
	validates :released, :inclusion => { :in => [true, false] }


	with_options if: :is_released? do |released|
		released.validates :release_year, :presence => true
		released.validates :release_year, :numericality => { :less_than_or_equal_to => :current_year}
	end
	
	def is_released?
		released == true
	end

	def current_year
		Date.today.year
	end

	
	
end