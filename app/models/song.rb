require 'pry'

class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :artist_name, presence: true
    #Cannot be repeated by the same artist in the same year???
    validates :released, inclusion: { in: [true, false]}
    validate :iwrywrit?
    validate :future?
    validate :sst?
    
    
    def iwrywrit?
        if released && release_year.nil?
            errors.add(:release_year, "must include title of release year if released") 
        end
    end
    
    def future?
        if release_year.to_i> Date.today.year
            errors.add(:release_year, "cannot release in the future")
        end
    end
    
    def sst?
        if Song.find_by artist_name: artist_name, title: title, release_year: release_year
            errors.add(:release_year, "cannot release same song twice in a year")
        end
    end
    
end
