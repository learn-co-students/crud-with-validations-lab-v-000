class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  # validates :title, uniqueness: true
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, presence: true, if: :been_released?



  def been_released?
    self.released
  end




end
