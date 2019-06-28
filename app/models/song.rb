class Song < ApplicationRecord
   validates :title, presence: true
   validates :artist_name, presence: true
   validate :released?
   validate :future_release?
   validate :same_song?

   def released?
    if released == true && release_year == nil
      errors.add(:release_year, "must have release year")
    end
  end

  def future_release?
    if release_year && release_year > Date.today.year
      errors.add(:release_year, "release year cannot be in the future")
    end
  end
  
  def same_song? 
    songs = Song.all
    matching_song = nil

    songs.each do |song|
        if song.title == title && song.artist_name == artist_name && song.release_year == release_year
            matching_song = song 
        end
    end

    if matching_song
        errors.add(:release_year, "artist cannot release the same title more than once a year")
    end
  end
end
