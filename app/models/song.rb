class Song < ActiveRecord::Base
  validates :title, :artist_name, :genre, presence: true
  validates :title, uniqueness: true
  validate  :clikbate

    def clikbate
#binding.pry
        if (released && release_year) && (Date.today.year > release_year  unless release_year == nil) || (!released && release_year.nil?)
        else
              errors[:released] << "does not compute"
       end
    end
#  validates :released, inclusion: {in: ["true","false"]}

   # def validate_year
   #   if release_year.blank? || Time.now.year < release_year
   #     errors[:base] << "The release year is invalid"
   #   end
   # end

end
