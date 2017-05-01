class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:artist_name, :release_year]}
  validates :artist_name, presence: true
  validate :val
  def val
    if release_year!=nil and release_year>2017 then errors.add(:release_year, "in the future") end
    if release_year==nil and released==true then errors.add(:release_year, "missing") end
  end
end
