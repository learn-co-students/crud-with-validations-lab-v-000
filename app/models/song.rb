class Song < ActiveRecord::Base
  validates :title, :artist_name, :genre, presence: true
  validates :title, uniqueness: true
  validate  :release_validation

    def release_validation
        if (released && release_year) && (Date.today.year > release_year  unless release_year == nil) || (!released && release_year.nil?)
        else
              errors[:released] << "errors in release status and year occured"
       end
    end

end
