
class Song < ActiveRecord::Base
  
  validates :title, presence: true, uniqueness: {
    scope: [:artist_name, :release_year]
  }
  
  validates :released, inclusion: { in: [true, false] }
  
  validates :release_year, presence: true, if: -> { released } 
  
  validates :artist_name, presence: true
  
  validate :no_future_release
  
  private
    
    def no_future_release
      if release_year
        unless release_year <= DateTime.now.year }
          errors.add(:release_year, "Songs can't be released in the future, they can only be unreleased!")
        end
      end
    end
  
end
