class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: [true, false]
  validates :release_year, presence: true, numericality: {less_than: Date.today.year + 1}, length: {is: 4}  , if: :is_released?
  validates :artist_name, presence: true

  def is_released?
    released == true
  end

end
