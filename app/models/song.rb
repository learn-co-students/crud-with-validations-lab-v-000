class Song < ActiveRecord::Base
  validates :title, uniqueness: {scope: :release_year, message: "cannot be repeated by artist"}
  validates :title, presence: true
  validates :released, inclusion: { in: [true,false] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, if: :released
end
