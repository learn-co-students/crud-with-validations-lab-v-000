class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: true
	validates :released, inclusion: { in: %w(true false)}
	validates :artist_name, presence: true
end
