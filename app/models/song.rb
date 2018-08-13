class Song < ActiveRecord::Base
    validates :title, presence: unique: true
    validates :artist_name, presence: true
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)} #customized 

end
