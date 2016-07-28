class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, numericality: {less_than_or_equal_to: 2016}, if: :released?
  validates :artist_name, presence: true
  
  def released?
    released
  end

end
