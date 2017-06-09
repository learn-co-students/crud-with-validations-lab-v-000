class Song < ActiveRecord::Base
  	validates :title, presence: true
    #validates_uniqueness_of :title, scope: :release_year
    validates :title, uniqueness: {scope: :release_year, message: "should happen once per year" }
    validates :released, inclusion: { in: [true, false] }
    #validates :released, exclusion: { in: [nil] }

    validates :artist_name, presence: true
    
    #validates :release_year, numericality: { only_integer: true }

    #validates :release_year, presence: true, if: :released?

    #validate :release_year_today_or_past?

    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
            less_than_or_equal_to: Date.today.year
        }

    end
    
    def released?
      released
    end

   # def release_year_today_or_past?
    #    if release_year.present? && release_year > Date.today.year
     #       errors.add(:release_year, "can't be in the future")
      #  end
    #end

end
