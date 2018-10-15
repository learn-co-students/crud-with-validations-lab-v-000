class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :release_year, :inclusion => {:in => [true, false]} 
    validates :released, presence: true
    validates :released, uniqueness: true 
    validates :artist_name, presence: true
    validates :genre, presence: true 

end
