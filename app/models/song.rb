class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true

  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :released
  validates_numericality_of :release_year, :less_than_or_equal_to => Date.today.year, :allow_nil => true
  validates :artist_name, presence: true

end ## class end
