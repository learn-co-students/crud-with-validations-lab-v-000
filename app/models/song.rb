class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year,
    message: "Cannot be repeated by the same artist in the same year" }

    # Must not be blank
    # Cannot be repeated by the same artist in the same year
end
