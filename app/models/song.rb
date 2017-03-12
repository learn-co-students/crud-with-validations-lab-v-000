class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :title, uniqueness: {scope: :release_year}
  validates :release_year, presence: true, if: :released?
  validates_numericality_of :release_year, less_than_or_equal_to: 2017, if: :released?
  validates :artist_name, presence: true



  def released?
    released == true
  end

end
