class Song < ActiveRecord::Base
  validates :artist_name, presence: true
  validates :title, presence: true
  #validates :boolean_field_name, inclusion: { in: [true, false] }
  #validates :release_year, numericality: {less_than: Time.now.year}
  # Title cannot be repeated by same artist in the same year
  #
  #


end
