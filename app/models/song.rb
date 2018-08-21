
class Song < ActiveRecord::Base
  
  validates :title, presence: true, uniqueness: {
    scope: [:artist_name, :release_year]
  }
  
  validates :artist_name, presence: true
  
  validates :released, inclusion: { in: [true, false] }
  
  validates :release_year, presence: true, if: :released? 
  validate :no_future_release
  
  private
    
    def released?
      released
    end
    
    def no_future_release
      if release_year
        unless release_year <= DateTime.now.year
          errors.add(:release_year, "Songs can't be released in the future, they can only be unreleased!")
        end
      end
    end
  
end
