class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :artist_name, presence: true
    validate :unique_title?
    validate :needs_release_year_if_released

    def unique_title?
        if Song.all.any? { |song| song.release_year == self.release_year && song.title == self.title && song.artist_name == self.artist_name }
            errors.add(:title, "cannot be repeated by the same artist in the same year")
        end
    end

    def needs_release_year_if_released
        if self.released && !self.release_year
            errors.add(:release_year, "cannot be blank if song has been released")
        end
        if self.release_year && self.release_year > Time.current.year
            errors.add(:release_year, "must be less than or equal to the current year")
        end
    end
end
