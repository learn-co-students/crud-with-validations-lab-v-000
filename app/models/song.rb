class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: "released?", inclusion: {in: 1..Time.now.year}
  validates :artist_name, presence: true

  def released?
    self.released == true
  end
end
