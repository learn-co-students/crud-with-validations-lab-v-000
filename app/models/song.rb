class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true if :released == true end 
end
