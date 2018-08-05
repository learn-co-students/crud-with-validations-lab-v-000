class Song < ActiveRecord::Base

validates :title, presence: true, uniqueness: true

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, inclusion: { in: (1..Date.today.year), message: "Invalid Year: Future"}
  end

  def released?
    self.released 
  end

end
