class Song < ActiveRecord::Base
    validates :title, presence: true, uniqueness: true #Needs work for uniqueness; must be unique for an artist in a year
    validates :released, inclusion: { in: [true, false] }
    validate :release_yr
    validates_numericality_of :release_year, :only_integer => true, :less_than_or_equal_to => Date.current.year, allow_nil: true
    #validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}
    validates :artist_name, presence: true #check

    def release_yr
        if self.released == true 
            unless !!self.release_year
                errors.add(:release_year, "must define release year")
            end

        end
    end
end
