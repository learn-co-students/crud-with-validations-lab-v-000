class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: {scope: :artist_name}
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.today.year }, presence: true, unless: Proc.new { |a| a.released == false}



end
