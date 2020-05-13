class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: true
    validates :release_year, numericality: { less_than_or_equal_to: 2020 }, allow_blank: true
    validates :release_year, presence: true, if: :released?

    def released?
        released == true
    end
end
