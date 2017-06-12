class Song < ActiveRecord::Base
	validates :title, :artist_name, presence: true
	validates :title, uniqueness: { scope: :release_year}
	validates :released, inclusion: {in: [true, false]}
	validate :release_year_valid?
end

def release_year_valid?
	if released 
		unless !release_year.nil? && release_year <= Time.now.year
			errors.add(:release_year, "Release year must be valid")
		end	
	end  		
end