class Song < ActiveRecord::Base
    
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year, message: "must be unique per artist per year"}

    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true
    
    validate :release_year_condition


    def release_year_condition
        # optional if `released` is false
        # must not be blank if `released` is true
            # and must be less than or equal to current year
        if (released == true) && !release_year
            errors.add(:release_year, "release year can't be blank if Song is released")
        elsif !!release_year && release_year > Date.current.year
            errors.add(:release_year, "release year can't be in the future")
        end
    end
end
