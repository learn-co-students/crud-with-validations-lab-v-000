class Song < ActiveRecord::Base
    validates :title, presence: true
    validate :title_released_same_year?
    validates :released, inclusion: { in: [ true, false ] }
    validates :artist_name, presence: true
    validates :release_year, presence: true, if: :released?
    validate :release_year_in_the_past?
    def released?
        released == true
    end 

    def release_year_in_the_past?
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "Error message")
        end
    end

    def title_released_same_year?
        if release_year.present? && Song.find_by(title: title, artist_name: artist_name, release_year: release_year)
            errors.add(:title, "Error Message 2")
        end
    end
end
