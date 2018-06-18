class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :release_year, presence: true, if: :released
    validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, if: :release_year
    validates :title, uniqueness: {scope: [:release_year, :artist_name]}
end
