class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :artist_name && :release_year }
  #title cannot be repeated by same artist in same year
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :song_released?, numericality: { less_than_or_equal_to: Date.current.year }
  validates :artist_name, presence: true

  def song_released?
    released == true
  end

end
