class Song < ActiveRecord::Base
  # validates :title, presence: true
  # { scope: [:release_year, :artist_name],
  #   message: "should happen once per year" }
  # validates :released,inclusion: {in: %w(true false)}
  # validates :artist_name, presence: true
  #
  # with_options if: :released? do |release|
  #     release.validates :release_year, presence: true
  #     release.validates :release_year, numericality: {
  #       :less_than_or_equal_to => Date.today.year}
  #
  #   end
  #   def released?
  #     self.released == true
  #   end

  validates :title, presence: true
  validates :title, uniqueness: {
    scope: %i[release_year artist_name],
    message: 'cannot be repeated by the same artist in the same year'
  }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :release_year, absence: true, :unless => :released?

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

    def released?
    released
    end

  end
