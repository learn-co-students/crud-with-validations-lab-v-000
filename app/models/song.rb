class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:artist_name, :release_year] }
    #Cannot be repeated by the same artist in the same year
    validates :released, inclusion: {in:[true, false]}
    validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, if: :released
    #Must be less than or equal to the current year
    validates :artist_name, presence: true
 
end