class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :release_year, message: "cannot be repeated by same artist in same year"}
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validates :release_year,
    presence: true, if: :released?,
    numericality: {less_than_or_equal_to: Time.current.year}

  def released?
    self.released == true
  end
end
