class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: {
    scope: [:release_year, :artist_name], message: "Title cannot be repeated by the same artist in the same year"}
    validates :release_year, numericality: {
        only_integer: true,
        less_than_or_equal_to: Date.current.year
    }
    validates :released, inclusion: { in: [ true, false ] }
    
end
