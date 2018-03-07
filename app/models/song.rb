class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validate :is_future_time
  validate :is_repeat_song

  def is_future_time
    if released == true && release_year == nil
      errors.add(:release_year, "invalid release year")
    elsif released == true && release_year >= Time.now.year
      errors.add(:release_year, "invalid release year")
    elsif released == false
      errors.delete(:release_year)
    end
  end

  def is_repeat_song
    Song.all.each do |s|
      if s.title == title && s.artist_name == artist_name && s.release_year == release_year
      errors.add(:title, "invalid title")
      end
    end
  end


end
