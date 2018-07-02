class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year,
    message: "should have title once per year" }
    validates :artist_name, presence: true
    validate :release_condition
    validates :release_year, presence: true, if: :released?

    def release_condition
      if release_year.present? && released == true && release_year > Date.today.year
        errors.add(:release_year)
      end
    end

end
