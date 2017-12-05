class Song < ActiveRecord::Base
    validates :title, presence: true 
    #validates :released, inclusion: { in: %w("true" "false"), message: "%{value} is not a valid value for released" }
    validates :artist_name, presence: true
    
    validate :release_not_in_future
    validate :title_cannot_be_repeated_in_same_year
    validate :must_have_release_year_when_released
    
     def release_not_in_future
        if release_year
         if release_year < 2018
         else
             errors.add(:release_year, "must not have a future release date")
         end
        end
     end
     
     def must_have_release_year_when_released
         if released
             if release_year
             else
               errors.add(:release_year, "must have release year if it has been released")
             end
         end
     end
     
 
    def title_cannot_be_repeated_in_same_year
       @songs = Song.all
        if Song.find_by(artist_name: artist_name)
          songs_by_artist = Song.where(artist_name: artist_name)
           songs_by_artist.each do |song|
            if song.title == self.title && song.release_year == self.release_year
                return errors.add(:title, "must not have same title as another song by same artist with the same release year.")
            end
            end
            
            return true
        else 
            return true
        end
    end
            
    #   if title != nil
    #      if indicators.map {|indicator| title.include?(indicator)}.include?(true)
    #     else
    #       errors.add(:title, "must include clickbait terms")
    #      end
    #   end
    # end
    
end
