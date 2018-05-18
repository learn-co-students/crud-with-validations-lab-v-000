class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :unique?
  validates :released, inclusion: { in: [true, false] }
  validate :year_correct?
  #validates :release_year, presence: true if :released == true,
  validates :artist_name, presence: true

  def unique?
    Song.all.each do |song|
      if song.title == title && song.release_year == release_year && song.artist_name == artist_name
        errors.add(:title, "repeat title must not share artist_name and release_year")
      end
    end
  end

  def year_correct?
    if released == true && (release_year == "" || release_year == nil)
      errors.add(:release_year, "release_year required if song was already released")
    end
    if !(release_year == "" || release_year == nil)
      if release_year > Date.today.year
        errors.add(:release_year, "release_year must be less than or equal to current year")
      end
    end
  end

end
