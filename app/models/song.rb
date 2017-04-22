class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: true, if: :release_year, uniqueness: true
  validates :artist_name, presence: true
  validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year, if: :released }

end
