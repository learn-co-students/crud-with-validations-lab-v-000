class Song < ActiveRecord::Base

  validates :title, presence: true
  validate :title_cannot_be_repeated_by_same_artist_in_same_year
  validates :released, inclusion: { in: [true, false] }
  validate :valid_release_year
  validates :artist_name, presence: true

  def valid_release_year
    if released == true
      if release_year.nil?
        errors.add(:release_year, "Release year must not be blank if song has been released")
      else
        if release_year > Time.new.year
          errors.add(:release_year, "Release year must be less than or equal to the current year")
        end
      end
    end
  end

  def title_cannot_be_repeated_by_same_artist_in_same_year
    if ((s = Song.find_by(title: title)) && (s.artist_name == artist_name) && (s.release_year == release_year) rescue nil)
      errors.add(:title, "Title cannot be repeated by the same artist in the same year")
    end
  end
  
end
