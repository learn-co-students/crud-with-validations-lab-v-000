class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :artist_name, :release_year, uniqueness: true
    validates :release_year, numericality: {
        only_integer: true,
        less_than_or_equal_to: ->{ Date.current.year }
    }
end
