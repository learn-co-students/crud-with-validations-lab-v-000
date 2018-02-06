class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, if: :released
  validates :release_year, presence: true, if: "released"

end
