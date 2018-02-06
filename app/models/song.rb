class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year }
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true
    validates :release_year, numericality: { only_integer: true }
    validates :release_year, presence: true, if: :valid_release_year?
    
    def valid_release_year?
        released != true && release_year <= Date.today.year 
    end 
end

