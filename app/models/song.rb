class Song < ActiveRecord::Base
    validates_presence_of :title
    validates :title, uniqueness: {
        scope: [:release_year, :artist_name],
    # HERE multiple attributes for the same key are grouped in brackets, WHICH GENERALLY GROUP THINGS TOGETHER
        message: "Song may only be released by artist once in the same year" 
    }
    #:scope is for constraining the uniqueness of certain attributes in relation to a main attribute AMONG RECORDS 
    #IN A DATABASE
    validates_presence_of :released if :released == true
    # validates :release_year, numericality: {less_than_or_equal_to: 2018}
    validate :release_year_true
    validate :release_year_not_future
    
    def release_year_true
        if released
            if release_year
            else
                errors.add(:release_year,  "Need a release year")
            end
        end
    end

    def release_year_not_future
        if release_year 
            if release_year <= 2018
            else
                errors.add(:release_year, "Release year must be 2018 or earlier")
            end
        end
    end
end

# Validate that age is an integer at least 13 and less than 150 validates :age, numericality: {only_integer: true, 
#greater_than_or_equal_to: 13, less_than: 150}
