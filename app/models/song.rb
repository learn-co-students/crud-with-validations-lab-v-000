class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :released, inclusion: {in: [true, false]}
    validate :release_year_if_in_future_or_unreleased
    validate :song_already_entered

    def release_year_if_in_future_or_unreleased
        if released && release_year.nil?
            errors.add(:release_year, "Cannot have an empty release year if released")      
        elsif !release_year.nil? && release_year > Date.today.year
            errors.add(:release_year, "Cannot have a release year in the future")
        end
    end

    def song_already_entered
        @song = Song.find_by(:title => title, :artist_name => artist_name, :release_year => release_year)
        if !@song.nil?
            errors[:base] << "Artist cannot have same title released in the same year"
        end
    end

end
