class Song < ActiveRecord::Base
    validates :title, :artist_name, presence: true
    validates :released, inclusion: { in: [true, false]}
    validates :artist_name, uniqueness: {scope: %i[release_year artist_name] }

    with_options if: :song_released? do |s|
        s.validates :release_year, presence: true
        s.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
    end

    def song_released?
        released
    end

end
