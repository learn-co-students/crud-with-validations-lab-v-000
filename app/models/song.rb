class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year]}

  validates :released, inclusion: { in: [true, false],
    message: "should be true or false"}

  #validates :release_year, presence: true, if: :released_is_true?
  with_options if: :released_is_true? do |released|
    released.validates :release_year, presence: true
    released.validates :release_year, inclusion: {in: 0..Date.today.year}
  end

  validates :artist_name, presence: true

  def released_is_true?
    released
  end
end
