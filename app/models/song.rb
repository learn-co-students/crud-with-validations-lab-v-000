class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: :released
  validate :is_not_in_the_future
  validate :is_not_same_song_in_same_year

  def is_not_in_the_future
    if release_year.to_i > Time.now.year
      errors.add(:release_year, "cannot be in the future")
    end
  end

  def is_not_same_song_in_same_year
    Song.all.each do |song|
      if song.title == title && song.release_year == release_year
        errors.add(:title, "cannot have the same song twice in one year")
      end
    end
  end

end
