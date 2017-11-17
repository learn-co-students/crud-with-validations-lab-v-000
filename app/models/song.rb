class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: { scope: :release_year,
    message: "should happen once per year" }
  validates :released, inclusion: { in: [ true, false ] }
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [ true, false ] }
 	
 	with_options if: :release_check do |check|
    check.validates :release_year, presence: true
    check.validates :release_year, numericality: { only_integer: true, allow_nil: true, less_than_or_equal_to: ->(_song){ Date.current.year }, message: "must be less than or equal to #{Date.current.year}" }
  

    def release_check
      released
  	end
    
  end
end

