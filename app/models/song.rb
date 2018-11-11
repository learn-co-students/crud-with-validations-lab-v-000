class Song < ActiveRecord::Base
  validates :title, presence: true
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, inclusion: { in: 0..Date.today.year }
    song.validates :release_year, uniqueness: true
  end

  def released?
    self.released == true
  end

end
