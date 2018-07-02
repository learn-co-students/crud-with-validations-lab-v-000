class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: {scope: :release_year}
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released?
    validate :valid_release_year?
    validates :artist_name, presence: true

    def released?
        released == true
    end

    def valid_release_year?
        if release_year != nil
            if release_year >= DateTime.now.year
                errors.add(:release_year, "Cannot be in the future")
            end
        end
    end
end
