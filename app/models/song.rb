require 'pry'
class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true

    validate :song_title_unique_for_year
    validate :optional_release_year
    validate :song_not_released_in_future

    def optional_release_year
        if self.released && !self.release_year.present?
            errors.add(:release_year, "can't be blank if released is TRUE") 
        end
    end
    def song_title_unique_for_year
        @same_song = Song.find_by(title: self.title)
        if self.released && @same_song && @same_song.release_year == self.release_year 
            errors.add(:title, "can't have released a song with the same title in the same year")
        end
    end
    def song_not_released_in_future
        if self.released && self.release_year && self.release_year > Date.today.year
            errors.add(:release_year, "release year can't be in the future")
        end
    end
end
