class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :release_year, scope: :artist_name}
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.new.year}, if: :released?
    validates :artist_name, presence: true
    validates :genre, presence: true

    def released?
       self.released == true 
    end



end
