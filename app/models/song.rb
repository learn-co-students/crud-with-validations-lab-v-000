class Song < ActiveRecord::Base
    validates :title, presence: true, uniqueness: true
    validates :release_year, presence: true, if: :released?
    validate :release_year_cannot_be_in_future


    def released?
        released == true
    end

    def release_year_cannot_be_in_future
        if !!release_year
            if release_year > Date.today.year
                errors.add(:release_year, "release year cannot be in the future")
            end
        end
    end

end
