class Song < ActiveRecord::Base
    validates :title, presence: true 
    validates :title, uniqueness: true 
    validates :release_year, presence: true, if: :released? 
    validate :future_release_year
    
    def future_release_year
        if !!release_year
            if self.release_year > Date.today.year 
                errors.add(:release_year, "Release year cannot be in the future")
            end 
        end 
    end 
    
end
