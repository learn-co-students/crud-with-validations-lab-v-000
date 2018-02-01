class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year,
    message: "should happen once per year" }
  validates :released, inclusion: { in: [true, false] }
  validate :release_info_valid?
  validates :artist_name, presence: true

 def release_info_valid?
   if self.released
     !!self.release_year  && self.release_year < 2019
   else
     !self.release_year
   end
 end

end
