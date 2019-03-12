class Song < ActiveRecord::Base
    validates :title, :uniqueness => {:scope => [:artist_name, :release_year]}
	validates :released, inclusion: { in: [ true, false ] }
	validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, allow_nil: true
	validates_presence_of :release_year, :if => :released?
	validates :title, presence: true
end
