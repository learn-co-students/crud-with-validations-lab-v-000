class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "Song can't be repeated by the same artist in the same year"
  }

  validates :released, inclusion: { in: [true, false] }

  validates :artist_name, presence: true

  with_options if: :released? do |song|
    if song.validates :release_year, presence: true
      song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year, message: "must be a number"}
    end
  end

  private

    def released?
      released
    end

end
