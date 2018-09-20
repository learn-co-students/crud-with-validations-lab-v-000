class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true
    validates :title, uniqueness: {scope: [:release_year, :artist_name]}

    # return to refactor
    with_options if: :released do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}
      end
      
      
end
