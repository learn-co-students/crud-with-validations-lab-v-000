class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "can't be repeated by the same artist in the same year"
  }
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, presence: true, if: :released_year_op
  validates :artist_name, presence: true

  def released_year_op
    if released == true
      true
    else
      false
    end
  end
end
