class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "no song title may be repeated by the same artist in the same year"}
  validates :released, inclusion: { in: [true, false] }
  with_options if: :released? do |released|
    released.validates :release_year, presence: true
    released.validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
  end
  validates :artist_name, presence: true

  def released?
    released == true
  end

end
