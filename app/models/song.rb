class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :artist_name, presence: true
    validates :artist_name, uniqueness: true
    validates :released, inclusion: { in: [ true, false ] }
    # validates :released_year, uniqueness: true
    # validates :category, inclusion: { in: %w(Fiction Non-Fiction)} #customized 

end
