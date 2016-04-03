class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year}
  validates :release_year, presence: false, if: "!released"
  validates :release_year, presence: true, if: "!!released"
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, if: "!!released"
end

