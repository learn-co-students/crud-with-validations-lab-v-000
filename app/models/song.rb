class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, presence: true
    validates :artist_name, presence: true
    validates :genre, presence: true
    validate :release_year

    def release_year
    end

end
