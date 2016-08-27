class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year}
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: {only_integer: true, less_than_or_equal_to: 2016}, if: :released?
  validates :artist_name, presence: true

  def released?
    self.released ? true : false
  end

end
