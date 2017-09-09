class Song < ActiveRecord::Base
  validates :artist_name, presence: true

  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :title]
  }

  validates :released, inclusion: { in: [true, false]}

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Time.now.year
    }
  end

  def released?
    released
  end




  #validates :boolean_field_name, inclusion: { in: [true, false] }
  #validates :release_year, numericality: {less_than: Time.now.year}
  # Title cannot be repeated by same artist in the same year
  #
  #


end
