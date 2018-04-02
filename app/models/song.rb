class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "song was already released by that artist in that year"}

  validates :released, inclusion: { in: [true, false] }

  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?

  def released?
    released
  end

end
