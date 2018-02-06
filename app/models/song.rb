class Song < ActiveRecord::Base
    
    validates :title, presence: true
    validates :released, inclusion: {in: [true, false]}
    validate :release_year_exists_unless_unreleased
    validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, if: :released?
    validates :artist_name, presence: true
    validate :not_repeated_by_same_artist_same_year
   
    def released?
        released
    end
    
    def release_year_exists_unless_unreleased
        if released && release_year == nil
            errors.add(:release_year, "Missing a release year")
        end
    end
    
    def not_repeated_by_same_artist_same_year 
        Song.all.each do |song|
            if song.title == title && song.artist_name == artist_name && song.release_year == release_year
              @non_unique = true
            end
        end
        if @non_unique == true
            errors.add(:title, "This song already exists")
        end
    end
    
end
