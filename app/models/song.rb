class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: %i[release_year title],
    message: "should happen once per year" }
  validates :artist_name, presence: true
  with_options if: :released do
    validates :release_year, presence: true
    validates :release_year, numericality: { less_than_or_equal_to: Time.new.year}
  end
  #with_options allows me to check validations, can check if condition is true for a validation
end
