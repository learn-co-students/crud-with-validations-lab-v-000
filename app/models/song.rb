class Song < ActiveRecord::Base
 validates :title, presence: true
 validates :title, uniqueness: {scope: [:release_year, :artist_name]}
 validates :released, inclusion: {in: [true, false]}
 validates :artist_name, presence: true
 validates :genre, presence: true
 
 with_options if: :was_released? do |you|
  you.validates :release_year, presence: true
  you.validates :release_year, numericality: {only_integer: true, less_than_or_equal_to: Time.now.year}
 end
 

 def was_released?
   !!released
 end
 
end
