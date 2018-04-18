class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: true
	validates_with SongValidator
end
