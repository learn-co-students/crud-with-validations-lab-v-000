class Song < ActiveRecord::
    # :title
    # Must not be blank
    # Cannot be repeated by the same artist in the same year
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:release_year, :artist_name],
        message: "cannot be repeated by the same artist in the same year" }
    validates :released, inclusion: {in: [true, false]}
    validates :release_year...

    if :released == true
        validates :release_year, presence: true
        validates :release_year, 
    # release_year, an integer
    #   Optional if released is false
    #   Must not be blank if released is true
    #   Must be less than or equal to the current year
    # artist_name, a string
    #    Must not be blank
    #   genre, a string
    

    
end
