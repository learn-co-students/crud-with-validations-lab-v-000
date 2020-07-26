class Song < ApplicationRecord

    validates :title, presence: true, uniqueness: true
    #Title: must not be blank, cannot be repeated by the same artist in the same year
    validates :released, inclusion: { in: [true, false] }
    #Released: Must be true or false
    
    with_options if: :released? do |released|
        released.validates :release_year, presence: true 
        released.validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
    end
    validates :title, uniqueness: { scope: :release_year,
    message: "should happen once per year" }
    

    # Release_Year: Optional if released is false 
    #Must not be blank if released is true 
    #Must be less than or equal to the current year
    validates :artist_name, presence: true
    #Artist: Must not be blank

end
