class Song < ActiveRecord::Base
    validates :title, presence: true, uniqueness: true
    validates :released, inclusion: { %w(true false)}
    validates :artist_name, presence: true
    validates :release_year, numericality: { only_integer: true }, presence: true, if: :released?

    def released?
        if released == true && release_year <= Time.now.year.to_i
            true
        else
            false
        end
    end
end
