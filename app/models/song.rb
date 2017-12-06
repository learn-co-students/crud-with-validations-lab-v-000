class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "Cannot be repeated by the same artist in the same year" }
    validates :release_year, presence: true, if: :released? 
    validates :release_year, numericality: { less_than: Date.today.year }, if: :released?
    
end
