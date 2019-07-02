class Song < ApplicationRecord
    validates :title, :artist_name,  presence: true 
    validates :released, inclusion: { in: [true, false] }
    if :released == true
        validates :release_year, presence: true 
    end
end
