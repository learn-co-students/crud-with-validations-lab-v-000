class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released,
    inclusion: {
      in: [true, false], 
      # Is there a better way to write this? ANY string value evaluates to true!
      # If I try 'in: ["true", "false"]', then values of "true" and "false" won't work!
      message: "must be 'true' or 'false'"
    }
end
