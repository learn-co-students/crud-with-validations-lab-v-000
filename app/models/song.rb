class Song < ApplicationRecord
  validates_presence_of :title, :artist_name
  validates :released, inclusion: {in: [true,false]}
  with_options if: :released do |s|
    s.validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}
    s.validates :title, uniqueness: {scope: :release_year}
  end
end
