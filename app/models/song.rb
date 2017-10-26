require 'pry'
class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :invalid_without_release_year_when_released_is_true
  validate :invalid_when_the_release_year_is_in_the_future
  validates :release_year, uniqueness: true

  def invalid_without_release_year_when_released_is_true
    if self.released == true && self.release_year == nil
       errors.add(:release_year, 'needs a release year')
    end
  end

  def invalid_when_the_release_year_is_in_the_future
    if self.release_year != nil
      if self.release_year > Time.now.year
      errors.add(:release_year, 'cant be in the future')
     end
   end
  end

end
