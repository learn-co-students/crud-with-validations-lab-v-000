class Song < ActiveRecord::Base
    validates_presence_of :title
    validates_presence_of :artist_name
    validates_presence_of :released if :released == true
end
