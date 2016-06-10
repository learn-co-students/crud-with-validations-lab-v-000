class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :title_repeat?
  validates_inclusion_of :released, in: [true, false]
  validate :release_year?
  validates :artist_name, presence: true


  private 
  def title_repeat?
    Song.all.each do |song|
      if self.title == song.title && self.release_year == song.release_year && self.id != song.id
        errors.add(:title, "Title already exists!")
      end
    end
  end

  private
  def release_year?
    if self.released
      if release_year == nil || release_year > Date.today.year
        errors.add(:release_year, "Release year problem!")
      end
    end
  end

end
