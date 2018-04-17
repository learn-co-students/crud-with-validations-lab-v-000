class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: {
		scope: [:release_year, :artist_name]
	}
	validates :released, inclusion: { in: [true, false] }
	validates :release_year, presence: true, if: :released
	validates :artist_name, presence: true
	validates :genre, presence: true
	validate :date_correct?
	
	def date_correct?
		if release_year 
			errors.add(:release_year, "Release year must be in the past") unless release_year < Date.today.year
		end
	end

	

end
