class Song < ActiveRecord::Base
	validates :title, presence: true
	validate :song_cannot_be_released_more_than_once_year
	validates :release_year, presence: true, if: :released
	validates :release_year, numericality: { only_integer: true }, if: :released
	validate  :release_year_cannot_be_future_date
	validates :artist_name, presence: true
	

	def release_year_cannot_be_future_date
	current_date = Time.new.year
	if released && release_year
	    if release_year > current_date
	      errors.add(:release_year, "can't be greater than current year.")
	    end
	end
  end

  def song_cannot_be_released_more_than_once_year	
  	if song = Song.find_by(title: title, release_year: release_year)
  		errors.add(:title, "cannot be repeated by the same artist in the same year")
  	end
  end

end
