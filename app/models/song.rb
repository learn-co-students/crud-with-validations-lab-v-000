class Song < ActiveRecord::Base
  validates :title, presence: true
  # cannot be repeated by the same artist in the same year
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, numericality: { only_integer: true}
  #release year is optional if released is false
  #must not be blank if released is true
  #must be less than or equal to current year
  validates :artist_name, presence: true
  # not sure if this is needed:
  # validates :genre, presence: true
end
