class Song < ActiveRecord::Base
    validates :title, presence: true
    #validates :released, inclusion: { in: %w(True False) }
    validates :artist_name, presence: true #check
end
