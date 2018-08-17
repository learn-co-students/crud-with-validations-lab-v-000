class Song < ActiveRecord::Base
  validates :title, presence: true
 validate :release_year_validate
 validate :release_year_not_in_future
 validate :song_uniqueness

 def release_year_validate
   if released
     if release_year.nil?
       errors.add(:release_year, 'Cannot be empty if released')
     end
   end
 end

 def release_year_not_in_future
   if release_year
     if Time.new.year < release_year
       errors.add(:release_year, 'Cannot be in future')
     end
   end
 end

 def song_uniqueness
   song_exists = Song.find_by_title(title)
   if song_exists
     if song_exists.release_year == release_year
       errors.add(:title, 'Cannt release the same song twice in a year')
     end
   end
 end

end
