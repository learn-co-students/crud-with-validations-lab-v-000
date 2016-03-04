class Song < ActiveRecord::Base
  validates :title, presence: true 
  validates :title, uniqueness: {scope: [:artist_name, :release_year]}
  validates :release_year, inclusion: { in: 1..Time.now.year}, presence: true, if: "released?"
  validates :artist_name, presence: true

  def released?
    self.released == true
  end
end
