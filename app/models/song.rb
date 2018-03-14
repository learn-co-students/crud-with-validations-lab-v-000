class Song < ActiveRecord::Base
  validates :title, uniqueness: {
    scope: [:artist_name, :release_year], message: "can't be by the same artist in the same year"
  }
  validates :released, inclusion: {in: %w(true false), message: "must be true or false"}
  validates :artist_name, presence: true


  
end



# validates :title, presence: true
# validates :content, length: {minimum: 100}
# validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

# validates :size, inclusion: { in: %w(small medium large),
#   message: "%{value} is not a valid size" }