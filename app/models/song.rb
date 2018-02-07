class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: :released_is_true?
  validates :artist_name, presence: true
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, :allow_nil => true
  validates :title, uniqueness: { scope: :release_year, message: "You can not release the same song twice in one year" }

  def released_is_true?
    released == true
  end

end
