class Song < ActiveRecord::Base
  validates :title, presence: true #works
  validates :title, :artist_name, uniqueness: {scope: :release_year} #not working
  validates :release_year, numericality: {less_than: Time.now.year, if: :released?} #works
  validates :artist_name, presence: true #works

private

  def released?
    !!self.released
  end

  def future?
    self.release_year < Time.now.year
  end


end
