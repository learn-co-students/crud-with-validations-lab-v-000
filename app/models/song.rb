class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "cannot be repeated by the same artist in the same year"
  }
  
  validates :released, inclusion: { in: [true, false]}
  validates :artist_name, presence: true

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  def released?
    released
  end

  # validate :is_repeated_by_the_same_artist_in_the_same_year?
  # validate :is_release_year_required?
  # validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.new.year }, allow_nil: true

  # def is_repeated_by_the_same_artist_in_the_same_year?
  #   if !!Song.find_by(title: title, artist_name: artist_name, release_year: release_year)
  #     errors.add(:title, "cannot be repeated by the same artist in the same year")
  #   end
  # end

  # def is_release_year_required?
  #   if released === true && release_year.nil? == true
  #     errors.add(:release_year, "must be filled when it is released.")
  #   end
  # end

end
