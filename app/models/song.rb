class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, if: :anything
  validates :release_year, uniqueness: true, if: :twice

  def released?
    released == true
  end

  def anything
    release_year
  end
  
  def twice
    Song.find_by(title: self.title)
  end

end