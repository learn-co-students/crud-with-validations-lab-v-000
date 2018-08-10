class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: { scope: :release_year,
    message: "should happen once per year" }
	validates :artist_name, presence: true
	validates :release_year, presence: true, if: :released?

	def released?
		released
	end

	validate :release_year_cannot_be_in_the_future

	def release_year_cannot_be_in_the_future
     if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "can't be in the future")
     end
    end


end
