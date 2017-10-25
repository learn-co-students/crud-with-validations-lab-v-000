class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year,
    message: "song has already been released by same artist this year" }
  validates :release_year, presence: true, if: :released, presence: true
  validates :release_year, numericality: { less_than: Time.current.year }, if: :released, presence: true
end
