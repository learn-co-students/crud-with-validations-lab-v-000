class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: {only_integer: true, less_than_or_equal_to: Date.today.year}, if: :release_year?
    validate :song_unique

    private
    def song_unique
        Song.where(title: title).each do |song|
            if song.release_year == release_year && song.artist_name == artist_name
                errors.add(:title, "Song must be unique.")
            end
        end
    end
end
