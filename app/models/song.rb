class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, presence: true
  validates :released, presence: true
  validate :release_year_check?

  #release_year is optional if released is false
  #release_year must be less than or equal to the current year
  binding.pry
  def release_year_check? #if this returns true the attribute is validated
    return_value = false
    if released
      #if released is true then check to see if the release_year is less than or equal to the current year, if it is then return true
      if release_year <= 2018
        return_value = true
      else
        return_value = false
      end
    else #if released is false return true
      return_value = true
    end
    return_value
  end #end release_year_check?

end
