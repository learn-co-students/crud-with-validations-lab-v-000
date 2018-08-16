class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :artist_name, presence: true
    validates :artist_name, uniqueness: true
    validates :released, inclusion: { in: [ true, false ] }
    validates :release_year, inclusion: {in: [ true, false]}
    
    with_options if: :optional_if_released_is_true? do |song|
      song.validates :release_year, presence: true 
      song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year }
    end


    def optional_if_released_is_true?
         released 
    end

end


# release_year, an integer
# Optional if released is false
# Must not be blank if released is true
# Must be less than or equal to the current year
