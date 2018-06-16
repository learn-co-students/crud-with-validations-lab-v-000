class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:release_year, :artist_name], message: "Song cannot be repeated by the same artist in the same year."}
    validates :released, inclusion: {in: [true, false]}
    validates :release_year, presence: true, if: :released
    validates :artist_name, presence: true 
    validate :no_future
    
    def no_future 
        if release_year.present? && release_year >= Time.now.year 
            errors.add(:release_year, "Cannot be a year that has not happened")
        end
    end
end
