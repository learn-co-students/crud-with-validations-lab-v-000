class Song < ActiveRecord::Base
    validates :title, presence: true


    # Must not be blank
    # Cannot be repeated by the same artist in the same year
end
