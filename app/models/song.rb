class Song < ActiveRecord::Base
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: { scope: :release_year}
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released 
    validate :released_conditions
        
def released_conditions
    if self.release_year
        if self.release_year > DateTime.now.year
            #false
            errors.add(:release_year, "can't be in the past")
        end 
    end
end 

end 