class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: true

    with_options if: :released? do |obj|
        obj.validates :release_year, presence: true
        obj.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
    end 

    def released?
        self.released
    end

end
