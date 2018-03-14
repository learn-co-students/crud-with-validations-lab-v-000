class Song < ActiveRecord::Base
  validates :title, presence: true
  
end



# validates :title, presence: true
# validates :content, length: {minimum: 100}
# validates :category, inclusion: {in: %w(Fiction Non-Fiction)}