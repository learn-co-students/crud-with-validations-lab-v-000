class Song < ActiveRecord::Base
      validates :title, presence: :true
      validates :title, uniqueness: {scope: :release_year}
      validates :released, inclusion: { in: [ true, false ] }
      validates :artist_name, presence: :true, allow_blank: :false

      with_options if: :released do |song|
        song.validates :release_year, presence: :true, allow_blank: :false
        song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
      end
    
end
