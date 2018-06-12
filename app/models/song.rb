class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validate :release_year_check
  validates :artist_name, presence: true
  validate :once_a_year


  private
  def release_year_check
    if release_year
      if released? && Time.new.year < release_year
        errors[:release_year] << "Release year must be equal to or earlier than current year if song is already released!"
      end
    elsif released? && !release_year
      errors[:release_year] << "You must provide the release year if song is already released!"
    end
  end

  def once_a_year
    @copy = Song.find_by_title(title)
    if @copy
      if (@copy.artist_name == artist_name) && (@copy.release_year == release_year)
        errors[:base] << "Artist cannot release the same song in one year!"
      end
    end
  end
end
