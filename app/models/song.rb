class Song < ActiveRecord::Base
	validates :title, :artist_name, presence: true
	validates :title, uniqueness: { scope: :release_year }
	validate :release

	def release
		if released == true && release_year == nil
			errors.add(:release, "Song has been released, so it must have a release year")
		end

		if release_year != nil && release_year >= Time.current.year
			errors.add(:release, "Song can't be released in future")
		end
	end
end