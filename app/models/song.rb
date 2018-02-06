class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true

  # If released is true, check that:
  #   release_year is not blank and that it's less than or equal to the current year
  validates :release_year, if: :released,
    presence: true,
    numericality: {:less_than_or_equal_to => Date.today.year}


  validate :not_replica?

  # If a song was released by the same artist in the same year:
  #   add an error to :title, if it's the same title as the song that was found.
  def not_replica?
    if song = Song.find_by(artist_name: attributes["artist_name"], release_year: attributes["release_year"])
      if attributes["title"] == song.title
        errors.add(:title, 
          "cannot be a replica of #{song.title} (#{song.release_year}), by #{song.artist_name}."
        ) 
      end
    end
  end

end
