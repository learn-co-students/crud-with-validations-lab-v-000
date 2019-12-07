class Song < ApplicationRecord
  validates :released,
    inclusion: {
      in: [true, false], 
      message: "must be 'true' or 'false'"
    }

  validates :release_year, 
    allow_blank: true, unless: -> {self.released == true},
    numericality: {
      only_integer: true,
      less_than_or_equal_to: Time.now.year
    }
  # How do I do this right? It needs to fail if left blank when :released is true.
  
  validates :title, presence: true
  validates :artist_name, presence: true
end
