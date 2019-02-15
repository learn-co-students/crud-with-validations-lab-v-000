class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  # validates :title, uniqueness: true
  validates :released, inclusion: { in: [true, false]}
  # Optional if released is false
  validates :release_year, presence: true, if: :been_released?


# for release_year
  # Optional if released is false

  # Must not be blank if released is true

  # Must be less than or equal to the current year


  def been_released?
    binding.pry
    self.released
  end




end
