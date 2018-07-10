class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:artist_name, :release_year]}
  validates :release_year, presence: true if: :self.released?


  def

end
