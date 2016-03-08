class Song < ActiveRecord::Base
  validates_presence_of :title, :artist_name

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: 'Title cannot be relased multiple times in the same year'
  }

  def released?
    released
  end

end
