class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false ] }
 	validates :artist_name, presence: true
 	validate :not_repeated
 	validate :right_year

  def not_repeated
    @song = Song.find_by(title: title)
 	  if @song && @song.artist_name == artist_name && @song.release_year == release_year
 		   errors.add(:title, 'cannot be repeated by the same artist in the same year.')
     end
   end

  def right_year
    if released
 			if release_year == nil
 				errors.add(:release_year, 'year must exist if the song is released')
 			end
 			if release_year && release_year > Time.new.year
 				errors.add(:release_year, 'must be less than or equal to current year')
 			end
 		end
 	end
end
