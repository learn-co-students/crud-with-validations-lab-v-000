class Song < ActiveRecord::Base
    validates :title, presence: true, allow_blank: false
    validates :title, uniqueness: {scope: :release_year}
    validates_inclusion_of :released, :in => [true, false]
    validates_presence_of :release_year, if: :released?
    validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, allow_blank: true
    validates :artist_name, presence: true, allow_blank: false
end
