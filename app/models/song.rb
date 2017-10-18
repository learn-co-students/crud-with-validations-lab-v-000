class Song < ActiveRecord::Base
  validates :title,
            presence: true, ## ok
            uniqueness: {
              scope: [:release_year, :artist_name],
              message: "cannot be repeated by the same artist in the same year"
            }
  validates :artist_name, presence: true ## ok
  validates :released, inclusion: { in: [true, false] }
  with_options if: :released? do |song|
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
    song.validates :release_year, presence: true
  end

  def released?
    self.released
  end

end
