class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: :released

  

  # def release_year_not_in_the_future?
  #   release_year <= Time.now.year
  # end
end

