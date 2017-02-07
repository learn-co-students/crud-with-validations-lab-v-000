class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :released_song_has_year?
  validate :released_song_in_past?
  validate :released_twice_in_a_year?

  def released_song_has_year?
    if released && !release_year
      errors.add(:release_year, "must be specified for a released song")
    end
  end

  def released_song_in_past?
    # binding.pry
    # Nested conditionals are used below to avoid an exception from comparing nil. Check if the solution has a more elegant approach.
    if released && release_year
      if release_year > Time.new.year
        errors.add(:release_year, "must be in the past for a released song")
      end
    end
  end

  def released_twice_in_a_year?
    self.class.all.each do |s|
      if release_year == s.release_year && title == s.title
        errors.add(:release_year, "may not be the same for two songs with the same title")
      end
    end
  end

end
