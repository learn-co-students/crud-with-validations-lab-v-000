class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year}

  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year.to_i }, presence: true, if: "released?"
  validates :artist_name, presence: true
end
