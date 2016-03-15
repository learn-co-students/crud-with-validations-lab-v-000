class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:release_year, :artist_name]} 
    validates :artist_name, presence: true
    validate :future_release_date
    validate :required_release_date
    
    def future_release_date
      if release_year.to_i > Time.now.year
          errors.add(:release_year, "Release year must not be in the future")
      end
    end
    
    def required_release_date
        if released == true 
            if release_year.nil?
                errors.add(:release_year, "Must have release year if song had been released")
            end
        end
    end

end
