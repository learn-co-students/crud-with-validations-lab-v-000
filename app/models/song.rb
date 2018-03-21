class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :title, uniqueness: { scope: [:release_year, :artist_name] }
  validates :release_year, presence: true, numericality: {less_than_or_equal_to: Time.current.year},
    if: :released
end
