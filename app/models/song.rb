class Song < ActiveRecord::Base
  validates :title, presence: true
   validates :artist_name, presence: true
   validates :title, uniqueness: { scope: :release_year }
   validate :ReleaseYearValue
 
   def ReleaseYearValue
     if released == true && release_year == nil
       errors.add(:release_year, "Required when song has been released")
     else
       if released == true && release_year > Date.today.year
         errors.add(:release_year, "Cannot be released in the future")
       end
     end
   end
end
