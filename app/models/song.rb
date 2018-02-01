class Song < ActiveRecord::Base
    validates :title, presence: true, uniqueness: true
    validates :released, inclusion: { in: [ true, false ] }
    validates :release_year, presence: true, if: :has_been_released? && :check_release_year
    validate :check_release_year
    validates :artist_name, presence: true

 def has_been_released?
   self.released == true
 end

 def check_release_year
   self.release_year <= Time.new.year
 end
end
