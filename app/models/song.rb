class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :artist_name, presence: true
    #validate :validate_released
    validate :validate_unique_title
    
    validates :release_year, presence: true, numericality: {less_than_or_equal_to: Date.today.year}, if: :released 

    #def validate_released
        #errors.add(:released, "must be boolean") unless self.released.is_a?(Boolean)
    #end
    
    def validate_unique_title
        if Song.find_by_title_and_release_year(self.title,self.release_year)
            errors.add(:title, "only one title per year")
        end
    end
end
