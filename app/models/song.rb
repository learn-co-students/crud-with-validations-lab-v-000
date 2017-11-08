class Song < ActiveRecord::Base
    validates :title, :artist_name, :genre, presence: true
    validates :title, uniqueness: { scope: :release_year, message: "artist cannot release the same song twice in a year" }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released?
    validate :release_year_cannot_be_in_the_future
    
    def release_year_cannot_be_in_the_future
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "can't be in the future")
        end
    end

end
