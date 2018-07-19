class Song < ActiveRecord::Base
    validates :title, presence: true, uniqueness: { scope: :release_year }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released?
    validates :artist_name, presence: true
    validate :current_year
    
    def current_year
        if release_year.present? && release_year > Date.current.year
            errors.add(:release_year, "must be less than current year")
        end
    end
end
