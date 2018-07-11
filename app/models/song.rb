class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released_true?
  validate :release_year_less_than_current_year
  validate :same_song_twice_in_year

  def released_true?
    released.present?
  end

  def release_year_less_than_current_year
    if release_year.nil?
    elsif release_year > Date.today.year
      errors.add(:release_year, "release year > current year")
    end
  end

  def same_song_twice_in_year
    #binding.pry
    Song.all.each do |song|
      #binding.pry
      if song.artist_name == self.artist_name && song.title == self.title && song.release_year == self.release_year
        errors.add(:release_year, "same song released in same yer")
      end
    end
  end

end
