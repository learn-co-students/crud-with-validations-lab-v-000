class Song < ActiveRecord::Base
# title can't be blank & can't be repeated by same artist in same year
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: %i[release_year artist_name],
    messsage: 'cannot be repeated by the same artist in the same year'
  }
# must be true or false
  validates :released, inclusion: { in: [true, false] }
# optional if released is false & must not be blank if true
# must be <= to the current year
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end
# must not be blank
  validates :artist_name, presence: true

  def released?
    released
  end

end
