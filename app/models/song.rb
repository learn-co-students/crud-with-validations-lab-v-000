class Song < ActiveRecord::Base
  validates_presence_of :title
  validates_uniqueness_of :title, scope: :release_year
  validates :release_year, presence: true, inclusion: { in: 1900..Date.today.year}, if: :released?


  # def date_not_in_future
  #   if !release_year.nil?
  #     if release_year > Date.today.year 
  #       false
  #     else
  #       true
  #     end
  #   end
  # end
end





# released, a boolean describing whether the song was ever officially released.
# Must be true or false
# Must be less than or equal to the current year
# artist_name, a string
# Must not be blank
# genre, a string