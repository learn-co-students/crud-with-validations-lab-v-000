class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: {scope: :release_year, message: "Cannot be repeated by the same artist in the same year"}

  validates :released, inclusion: {in: [true,false]}

  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, if: :released
end
