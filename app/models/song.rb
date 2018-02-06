class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :artist_name, presence: true
    validate :no_repeated_title
    validates :release_year, presence: true, 
        if: :released?
    validate :date_not_possible

    def no_repeated_title
        if Song.any? {|s| s.title == title && s.artist_name == artist_name && s.release_year == release_year}
            errors.add(:title, "can't add the same song twice")
        end
    end

    def date_not_possible
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "release year can't be in the future")
        end
    end

end
