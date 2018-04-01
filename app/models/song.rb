class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :release_year}
  validates :artist_name, presence: true

  with_options if: :released? do |released|
    released.validates :release_year, presence: true
    released.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}
  end

end
