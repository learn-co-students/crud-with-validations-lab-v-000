class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, if: :not_nil? 
  validates :release_year, uniqueness: true, if: :already_released?

  def released?
    released == true
  end

  def not_nil?
    release_year
  end

  def already_released?
    Song.find_by(title: self.title)
  end



end
