class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :release_year}
  validates :release_year, presence: true, if: :released?
  validate :release_year_date




  def released?
   released
  end 

     release_year = Date.today.year
    
    def release_year_date
      if release_year.present? && release_year > Date.today.year
        errors.add(:release_year, "can't be in the future")
      end
      
    end
   

end
