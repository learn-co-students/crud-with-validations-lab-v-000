class Song < ActiveRecord::Base
    validates :title, presence: true, uniqueness: { scope: :release_year, message: "this song was already released this year"}
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, numericality: { less_than_or_equal_to: 2018 }, if: :released?, allow_nil: false
    validates :artist_name, presence: true
end
