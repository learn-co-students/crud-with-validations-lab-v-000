class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: :released?
  validate :realease_date_can_not_be_in_future
  validates :title, uniqueness: true, if: :release_year, uniqueness: true

 def realease_date_can_not_be_in_future
   if release_year.present? && release_year > Time.now.year
     errors.add(:release_year, "can't be in the future")
   end
 end

end
