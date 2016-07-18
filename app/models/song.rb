class Song < ActiveRecord::Base
  validates :title, presence: :true
  validates :title, uniqueness: :true

  validates :released, inclusion: { in: [true, false] }
  validates :released, exclusion: { in: [nil] }

  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: {less_than_or_equal_to: 2016}, if: :released?
 
 
  def released?
    self.released == true
  end
end
