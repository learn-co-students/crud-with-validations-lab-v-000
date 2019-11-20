class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?
    validates :released, inclusion: {in: [true, false]}
    validates :title, uniqueness: {scope: :release_year}
    

    

end
