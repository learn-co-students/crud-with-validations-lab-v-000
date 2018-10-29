class Song < ActiveRecord::Base
    #VALIDATIONS
    validates :title, presence: :true
    validates :title, uniqueness: { scope: :release_year}
    validates :released, inclusion: { in: [true, false]}
    validates :released, exclusion: { in: [nil]}    
    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
    end

end
