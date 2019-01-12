class Song < ApplicationRecord
  validates :title, presence: true
  validates :release_year, presence: true
  validates :released, presence: true
end
 
