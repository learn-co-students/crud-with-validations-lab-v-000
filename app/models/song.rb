class Song < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validate :artist_cannot_release_two_songs_with_same_name_in_a_year, :release_year_cannot_be_in_future

  def artist_cannot_release_two_songs_with_same_name_in_a_year
    if old_song = Song.find_by(title: self.title)
      if self.id != old_song.id
        unless (old_song.artist_name != self.artist_name) && (old_song.release_year != self.release_year)
          self.errors[:title] << "This artist already released a song with this name this year"
        end
      end
    end
  end

  def release_year_cannot_be_in_future
    if self.released
      if self.release_year
        unless (self.release_year <= Date.current.year)
          self.errors[:release_year] << "A song cannot have a release date in the future"
        end
      else
        self.errors[:release_year] << "A song cannot be released without a release date"
      end
    end
  end
end
