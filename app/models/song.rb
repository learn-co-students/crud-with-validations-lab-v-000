class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: :released
  validate :current_release, if: :released
  validates :release_year, uniqueness: true
  validates :artist_name, presence: true

   def current_release
     return unless release_year
      if Time.current.year < release_year

       errors.add(:release_year, "Can't be in the future")
     end
   end


end
