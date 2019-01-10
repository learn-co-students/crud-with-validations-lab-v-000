class Song < ActiveRecord::Base
    validates :title, presence: true, uniqueness: {
    scope: %i[release_year artist_name],
    message: 'same artist cannot release the same title in the same year'
   }
    validates :released, inclusion: { in: [ true, false ] }
    validates :release_year, presence: true, numericality: {
      less_than_or_equal_to: Date.today.year
    }, if: -> { self[:released] }

    validates :artist_name, presence: true


end
