class Song < ActiveRecord::Base
    validates :title, presence: true
    #Cannot be repeated by the same artist in the same year
    
end
