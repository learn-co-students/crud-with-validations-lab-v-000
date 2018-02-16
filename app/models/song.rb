class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?
  validates :release_year, inclusion: { in: 1900..Date.today.year }, if: :released?
  validates :artist_name, presence: true


  def released?
    self.released
  end
end
