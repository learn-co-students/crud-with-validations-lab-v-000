class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true

  with_options if: :released do |s|
    s.validates :release_year, numericality: { less_than: Date.today.year}
    s.validates :release_year, presence: true
  end
  validates :title, uniqueness: { scope: :release_year,
    message: "can not be re-released in the same year" }


end
