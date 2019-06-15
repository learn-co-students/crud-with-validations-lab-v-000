class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:artist_name, :release_year], message: "this artist already released a song with this title this year"}
    validates :released, inclusion: { in: [true, false]}
    with_options if: :released? do |song|
        song.validates :release_year, presence: true, numericality: {less_than_or_equal_to: Date.today.year}
    end
    validates :artist_name, presence: true

    def released?
        released
    end

end
