class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :release_year, presence: true, if: :released, presence: true
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, allow_nil: true

end
