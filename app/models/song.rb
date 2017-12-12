class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :released, inclusion:  {in: [true, false]}
  # validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  validate :release_year_must_not_be_in_the_past
  validate :released_song_has_a_release_year
  validate :song_uniqueness

  def release_year_must_not_be_in_the_past
    if (release_year.present? && release_year > Date.today.year)
      errors.add(:release_year, "can't be in the future")
    end
  end

  def released_song_has_a_release_year
    if (released && !release_year.present?)
      errors.add(:release_year, "release year required when song is released")
    end
  end

  def song_uniqueness
    validation_fail = false

    Song.all.each do |song|
      if (song.title == title && song.artist_name == artist_name && song.release_year == release_year)
        validation_fail = true
      end
    end

    if validation_fail
      errors.add(:title, "same song can not be released by the same artist twice in one year")
    end

  end

  def to_s
    self.artist_name + " - " + self.title
  end




end
