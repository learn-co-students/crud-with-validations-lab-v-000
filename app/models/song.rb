class Song < ActiveRecord::Base
    # :title
    # Must not be blank
    # Cannot be repeated by the same artist in the same year
    validates :artist_name, presence: true
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:release_year, :artist_name],
        message: "cannot be repeated by the same artist in the same year" }
    validates :released, inclusion: {in: [true, false]}

    # release_year, an integer
    #   Optional if released is false
    #   Must not be blank if released is true
    #   Must be less than or equal to the current year
    # artist_name, a string
    #    Must not be blank
    #   genre, a string
    
    with_options if: :released? do |song|
      song.validates :release_year, presence: true
      song.validates :release_year, numericality: {
        less_than_or_equal_to: Date.today.year
      }
    end
  
    def released?
      self.released
    end
    
end
