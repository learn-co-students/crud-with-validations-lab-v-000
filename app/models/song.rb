class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name],
    message: "should happen only once per year per artist" }
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, if: :released?

  def released?
    released == true
  end
end
