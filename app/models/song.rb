class Song < ActiveRecord::Base
  validates :title, presence: true
# validates :title, uniqueness: true
  # validate release_year_conditions
  # uniqueness: { scope: :release_year, message: "should happen once per year" }

#  def release_year_conditions
#     if self.released == true && self.release_year == nil
#       errors.add(:release_year, " must have value, if released is true " )
#     end
#   end
end