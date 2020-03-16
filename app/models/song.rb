class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :release_year }
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true
    validates :release_year, presence: true, if: :released?, numericality: { less_than: Date.current.year }

    def released?
        released == true
    end

end
