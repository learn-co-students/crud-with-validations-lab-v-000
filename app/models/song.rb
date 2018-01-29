require 'pry'
class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:release_year, :artist_name]} #cannot repeat in same year
  validates :released, inclusion: {in: [true, false]}

  validates :artist_name, presence: true

  validates :release_year, presence: true, if: :released_true?

  validates :release_year, numericality: {less_than_or_equal_to: Date.today.year, if: :released_true?, message: "numericality error"}

  def released_true?
  released
  end

end
