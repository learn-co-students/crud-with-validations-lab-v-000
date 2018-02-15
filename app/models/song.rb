class Song < ActiveRecord::Base
  #title must be present, and unique per artist name and the release year
  validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name]}

  #only true or false for released
  validates :released, inclusion: { in: [true, false], message: "must be true or false"}
  #artist name mandatory
  validates :artist_name, presence: true
  #
  with_options if: :released? do |song|
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end

  def released?
    released == true
    #or could have been written the way below, same thing
    #released

  end

end
