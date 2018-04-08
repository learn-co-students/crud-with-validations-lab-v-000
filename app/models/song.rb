class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, :inclusion => {:in => [true, false]}
  validates :release_year, presence: true, if: :released?,  numericality: {less_than_or_equal_to: 2018}
  validates :artist_name, presence: true
end
