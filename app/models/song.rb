class Song < ActiveRecord::Base
  validates :title,
    presence: true,
    uniqueness: { scope: [:artist_name, :release_year],
      message: 'cannot be repeated by the same artist in the same year' }
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end

  def released?
    released
  end

  # validate :release_year_validations
  # def release_year_validations
  #   if released && release_year.present? && release_year > Date.today.year
  #     errors.add(:release_year, "can't be in the future")
  #   end
  # end

  # validate :no_duplicate_song_in_a_year
  # def no_duplicate_song_in_a_year
  #   song = Song.find_by(title: title, artist_name: artist_name, release_year: release_year)
  #   if song && song.id != id
  #     errors.add(:title, "cannot be repeated by the same artist in the same year")
  #   end
end
