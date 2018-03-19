class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name] }
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, if: :released
  validates :artist_name, presence: true

end
