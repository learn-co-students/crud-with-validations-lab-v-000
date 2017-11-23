class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :unique_title_in_artist

  def unique_title_in_artist
    if Song.all.any? do |song|
      song.artist == :artist_name && song.release_year == :release_year && song.title == :title
      errors[:title] << "This artist already has a song with this title released in this same year."
      end
    end
  end
end
