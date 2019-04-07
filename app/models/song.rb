class Song < ActiveRecord::Base
  validates :title, presence: true
  # validates :title (cannot be repeated by same arist in the same year)
  validates :unique_title, confirmation: true
  validates :released, inclusion: [true, false]
  validates :release_year, presence: true, if: :released
    validates :past_year, confirmation: true
  validates :artist_name, presence: true

  def past_year
    if release_year
      if release_year != Time.now.year && release_year > Time.now.year
        errors[:release_year] << "Year can't be in the future"
      end
    end

  def unique_title
    song = Song.find_by(title)
    if title && song
      if song.release_year == release_year
        errors[:title] << "Cannot have the same song title in the same year"
      end
    end
  end

  end


end
