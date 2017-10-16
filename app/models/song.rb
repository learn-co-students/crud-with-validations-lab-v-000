class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :released, inclusion: {in: [true, false]}

  validates :title, uniqueness: {scope: [:release_year, :artist_name], message: "cannot repeat a title by the same artist in the same year"}

  with_options if: :released? do |y|
    y.validates :release_year, presence: true
    y.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
  end

end
