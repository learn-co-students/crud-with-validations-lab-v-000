class Song < ActiveRecord::Base
  validates :title , uniqueness: { scope: :release_year, message: "should happen once per year" }
end
