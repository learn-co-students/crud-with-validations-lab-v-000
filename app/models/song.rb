class Song < ActiveRecord::Base
  validates :title, format: {with: /[a-zA-Z]/}
  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false ] }
  validate :release_year_validity
  validates :artist_name, format: {with: /[a-zA-Z]/}
  validates :genre, format: {with: /[a-zA-Z]/}

  def release_year_valid_for_released_song
    release_year.class == Fixnum && release_year <= Date.today.year && release_year != nil
  end

  def release_year_valid_for_unreleased_song
    (release_year.class == Fixnum || release_year.class == nil) && release_year >= Date.today.year
  end

  @song = Song.create(title: "cool", released: true, release_year: 2020, artist_name: "Air", genre: "Post-rock")

  def release_year_validity
    if released
      release_year_valid_for_released_song
    elsif released == false
      release_year_valid_for_unreleased_song
    end
  end

end
