class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :release_year_conditions

  with_options if: :released? do |released|
    released.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end
  
  with_options if: :release_year? do |year|
    year.validates :title, uniqueness: { scope: :release_year, message: "should happen once per year" }
  end
 # uniqueness: { scope: :release_year, message: "should happen once per year" }



 def release_year_conditions
  # binding.pry
    if self.released == true && self.release_year == nil
      errors.add(:release_year, " must have value,  released is true " )
    end
  end

    # validate :date_must_be_past_one_year

  # def year_must_be_in_the_past
  #   binding.pry
  #   this_year = Date.today.year
  #   if (self.release_year >= this_year)
  #     errors.add(:release_year, "date must be in the past at least one year")
  #     # else
  #     #   return true
  #   end
  # end
end
# release_year <= Time.now.strftime("%Y").to_i