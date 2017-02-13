require 'pry'

class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true
    validate :release_year_if_released
    validate :no_repeat_title_with_artist_and_year

    def release_year_if_released
        if released
            if release_year
                unless release_year <= Date.today.year
                  errors.add(:release_year, "release year cannot be in the future")
               end
           else
                errors.add(:release_year, "must have release year")
           end
        end
      end

# binding.pry

      def no_repeat_title_with_artist_and_year
        Song.all.each do |song|
            if song.artist_name == artist_name && song.release_year == release_year
                if song.title == title
                    errors.add(:title, "cannot have duplicate title with same artist and year")
                end
            end
        end
      end

end
