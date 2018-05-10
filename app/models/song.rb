class Song < ActiveRecord::Base
    validates :title, presence: true
    validate :no_repeat_year?
    validates :title, :uniqueness => {:scope => [:artist_name, :release_year]}
    def no_repeat_year?
        if released && release_year.nil?
            errors.add(:no_repeat_year?, "you need to include a release year if released!")
        elsif release_year != nil && release_year > Date.today.year
            errors.add(:no_repeat_year?, "a song can not be released in the future!")
        end
    end
end
