class Song < ActiveRecord::Base
  validates :artist_name, presence: true
  validates :released, presence: true
  validates :title, presence: true, uniqueness: { scope: :release_year, message: "only one per year" }

  validates :release_year, presence: true, if: :rel_true?, numericality: {less_than_equal_to: Date.today.year}

  def rel_true?
    released == true
  end
end
