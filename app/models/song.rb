
class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year }
    validates :released, exclusion: { in: [nil] } 
    validates :artist_name, presence: true
    validate :release_year_cannot_be_in_the_future, :release_year_must_be_present_if_released

    def release_year_cannot_be_in_the_future
        if release_year.present? && release_year > Time.now.year
            errors.add(:release_year, "can't be in the future")
        end
    end 

    def release_year_must_be_present_if_released
        if released && !release_year.present?
            errors.add(:release_year, "can't be in the future")
        end
    end
    ## validation for release_year: 
    ## presence: true if :released is true
    ## value <= current year
end
