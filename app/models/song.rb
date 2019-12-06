class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released,
    inclusion: {
      in: [true, false], 
      # Is there a better way to write this? ANY string value besides "false" evaluates to true!
      # If I try 'in: ["true", "false"]', then values of "true" and "false" won't work!
      # Is this because :released is a "boolean" datatype, rather than "string"? It seems to work with :artist_name.
      # I found this: https://api.rubyonrails.org/classes/ActiveModel/Type/Boolean.html
      message: "must be 'true' or 'false'"
    }
end
