class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year}
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :release_year, length: {is: 4}, if: :is_released?

  def is_released?
    self.released == true
  end


end
