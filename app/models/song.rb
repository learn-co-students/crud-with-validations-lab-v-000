class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :artist_name, presence: true
  validates :release_year, numericality: {less_than_or_equal_to: Time.current.year}
  validate :is_there_released_year

  def is_there_released_year
    if released 
      :release_year != nil
    else
      errors.add(:release_year, "can not be empty")
    end
  end

end