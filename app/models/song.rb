class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true #Must not be blank
  validates :released, inclusion: { in: [true, false] } #Must not be blank if released is true, optional if released is false
  validates :title, uniqueness: {scope: [:release_year, :artist_name]} #Cannot be repeated by the same artist in the same year
  validates :release_year, presence: true, numericality: {less_than_or_equal_to: Time.current.year}, #Must be less than or equal to the current year
  if: :released
end
