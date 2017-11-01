class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :artist_name, presence: true, uniqueness: { scope: :release_year }
  validates :release_year, presence: true, inclusion: { in: 0..Time.now.year }, if: :released?

  def released?
    self.released
  end

end
